# == Schema Information
#
# Table name: authentication_tokens
#
#  id           :integer          not null, primary key
#  name         :string
#  device_token :string
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class AuthenticationTokenTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
