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
      #if it comes from the itinerary rsvp form
      # loop through each assignment by id
      # update attributes for rsvp column to true or false
      if params[:assignment][:registration_type] == "from_guest_rsvp"
        binding.pry
      end

    else
      Assignment.create(guest_id: params[:assignment][:guest_id], sub_event_id: params[:sub_event_id])
    end
  end
end
