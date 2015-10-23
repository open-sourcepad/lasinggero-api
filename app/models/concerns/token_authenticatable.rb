module TokenAuthenticatable
  extend ActiveSupport::Concern

  module ClassMethods
    def find_by_authentication_token(authentication_token = nil)
      if authentication_token
        AuthenticationToken.find_by_name(authentication_token).try(:user)
      end
    end
  end

  def reset_authentication_token!(device_token)
    auth_token = self.authentication_tokens.where(device_token: device_token).first_or_initialize
    auth_token.name = generate_authentication_token
    auth_token.save!
    auth_token.name
  end

  def destroy_authentication_token(device_token)
    self.authentication_tokens.where(device_token: device_token).destroy_all
  end


  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless AuthenticationToken.find_by_name(token)
    end
  end
end
