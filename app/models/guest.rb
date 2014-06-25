class Guest < ActiveRecord::Base
  belongs_to :main_event
  has_many :assignment
  has_many :sub_events, through: :assignment
end
