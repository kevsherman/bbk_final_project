class Assignment < ActiveRecord::Base
  belongs_to :guest
  belongs_to :sub_event
  validates_presence_of :guest_id, :sub_event_id
  validates_numericality_of :guest_id, :sub_event_id, {only_integer: true}

  

  def self.create_for_type(params)
    if params[:assignment][:registration_type] == "from_sub_event_show"
    @guest_ids = params[:assignment][:guest_id]
    @guest_ids.each do |g_id|
      new_assignment = Assignment.new(guest_id: g_id, sub_event_id: params[:sub_event_id])
      if new_assignment.guest_id
        new_assignment.save
      end
    end

    elsif
      if params[:assignment][:registration_type] == "from_guest_rsvp"
        rsvps = params[:subEventId]
        rsvps.map do |sub_event_id, answer|
          guest_event = Assignment.where(guest_id: params[:assignment][:guest_id]).where(sub_event_id: sub_event_id).first
          guest_event.update(rsvp: answer)
          guest_event.save
        end
      end
    else
      Assignment.create(guest_id: params[:assignment][:guest_id], sub_event_id: params[:sub_event_id])
    end
  end
end
