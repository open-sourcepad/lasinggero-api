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

require 'test_helper'

class DrinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
