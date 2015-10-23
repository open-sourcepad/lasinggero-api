# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string           default(""), not null
#  weight                 :float            not null
#  age                    :integer
#  gender                 :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :token_authenticatable,
         :recoverable, :trackable, :validatable

  enum gender: [:male, :female]

  has_many :occasions, dependent: :destroy
  has_many :occasion_drinks, dependent: :destroy
  has_many :authentication_tokens, dependent: :destroy

  validates_presence_of :email

  def self.find_by_username_or_email(sign_in)
    where("(LOWER(username) = :sign_in OR LOWER(email) = :sign_in)", sign_in: sign_in.downcase).first
  end
end

