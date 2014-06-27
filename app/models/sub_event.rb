class SubEvent < ActiveRecord::Base
  belongs_to :main_event
  has_many :assignments
  has_many :guests, through: :assignments

  validates_presence_of :main_event_id, :title, :location, :date, :start_time, :end_time
  validates_numericality_of :main_event_id, { only_integer: true}

end
