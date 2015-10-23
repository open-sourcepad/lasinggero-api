class OccasionDrink < ActiveRecord::Base
  belongs_to :user
  belongs_to :drink
  belongs_to :ocassion
end
