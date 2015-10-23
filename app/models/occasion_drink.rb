# == Schema Information
#
# Table name: occasion_drinks
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  drink_id    :integer
#  occasion_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  amount      :integer
#

class OccasionDrink < ActiveRecord::Base
  belongs_to :user
  belongs_to :drink
  belongs_to :ocassion

  def alcohol_unit_per_serving
    drink.alcohol_unit_per_serving
  end
end
