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

require 'test_helper'

class OccasionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
