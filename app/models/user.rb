class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :main_events
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :email, format: {with: VALID_EMAIL_REGEX }
end
