# == Schema Information
#
# Table name: drinks
#
#  id           :integer          not null, primary key
#  name         :string
#  category_id  :integer
#  alc_percent  :float
#  serving      :float
#  serving_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Drink < ActiveRecord::Base
  belongs_to :category

  validates_presence_of :category_id

  def alcohol
    alc_percent || category.alc_percent
  end

  def alcohol_unit_per_serving
    (serving * (alcohol)) / 1000
  end
end
