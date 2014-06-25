class SubEvent < ActiveRecord::Base
  belongs_to :main_event
  has_many :assignments
  has_many :sub_events, through: :assignments

  validates_presence_of :main_event_id, :title, :location, :start_time, :end_time
end
