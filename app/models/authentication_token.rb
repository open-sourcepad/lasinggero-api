class AuthenticationToken < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :device_token, :user_id

  def self.clean_up_tokens(token, user_id)
    where('device_token =? AND user_id !=?', token, user_id).delete_all
  end
end
