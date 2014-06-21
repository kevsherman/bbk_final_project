class SubEvent < ActiveRecord::Base
  belongs_to :main_event
  has_many :assignments
  has_many :sub_events through: :assignments
end
