class Assignment < ActiveRecord::Base
  belongs_to :guest
  belongs_to :sub_event
end
