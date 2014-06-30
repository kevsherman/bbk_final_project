class MainEvent < ActiveRecord::Base
  belongs_to :user
  has_many :sub_events
  has_many :guests

  validates_presence_of :user_id, :title, :groom_full_name, :bride_full_name
  validates_numericality_of :user_id, {only_integer: true}
  validates_uniqueness_of :user_id

end

