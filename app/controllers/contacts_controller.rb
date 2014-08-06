class ContactsController < ApplicationController

  def index
    @contacts=request.env['omnicontacts.contacts']
    @main_event=main_event
  end

  def failure
    @request=request
  end

end