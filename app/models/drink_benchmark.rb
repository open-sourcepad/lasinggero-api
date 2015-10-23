class DrinkBenchmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :drink

  validates_uniqueness_of :drink_id, scope: :user_id

  def alcohol_unit_per_serving
    drink.alcohol_unit_per_serving
  end
end
