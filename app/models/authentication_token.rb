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

class AuthenticationToken < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :device_token, :user_id

  def self.clean_up_tokens(token, user_id)
    where('device_token =? AND user_id !=?', token, user_id).delete_all
  end
end
