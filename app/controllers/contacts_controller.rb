class ContactsController < ApplicationController

  def index
    @contacts=request.env['omnicontacts.contacts']
  end

  def failure
    @request=request
  end

end