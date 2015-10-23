# == Schema Information
#
# Table name: occasion_drinks
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  drink_id    :integer
#  ocassion_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  amount      :integer
#

require 'test_helper'

class OccasionDrinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
