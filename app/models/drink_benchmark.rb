class DrinkBenchmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :drink

  validates_uniqueness_of :drink_id, scope: :user_id
end
