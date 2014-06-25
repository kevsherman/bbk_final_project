class Assignment < ActiveRecord::Base
  belongs_to :guest
  belongs_to :sub_event
  validates_presence_of :guest_id, :sub_event_id
  validates_numericality_of :guest_id, :sub_event_id, {only_integer: true}
end
