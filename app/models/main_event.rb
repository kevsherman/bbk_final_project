class MainEvent < ActiveRecord::Base
  belongs_to :user
  has_many :sub_events
  has_many :guests
end
