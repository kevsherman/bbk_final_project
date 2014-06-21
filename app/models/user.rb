class User < ActiveRecord::Base
  has_many :main_events
end
