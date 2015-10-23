class DrinkBenchmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :drink
end
