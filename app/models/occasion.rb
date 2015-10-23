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

class Occasion < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title
end
