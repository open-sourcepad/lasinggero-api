# == Schema Information
#
# Table name: occasions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  location   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Occasion < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title

  has_many :occasion_drinks

  def current_alcohol_units
    occasion_drinks.inject(0) {|sum, b| sum + b.alcohol_unit_per_serving }
  end

  def alcohol_units_left(user)
    user.max_benchmark - current_alcohol_units
  end

  def percentage_until_max(user)
    if user.max_benchmark == 0
      100
    else
      (1 - (alcohol_units_left(user) / user.max_benchmark)) * 100
    end
  end

  def servings_left_until_max(user, current_drink = nil)
    if current_drink.present?
      (alcohol_units_left / current_drink.alcohol_units_per_serving).floor
    else
      0
    end
  end

end
