class User < ActiveRecord::Base
  has_many :main_events
  has_secure_password
  validates :email, presence: true
end
