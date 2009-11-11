class ReferenceAddressController < ApplicationController
    def index
    @reference_address = ReferenceAddress.find(:all, :conditions => ['city LIKE ?', "#{params[:search]}%"])
  end
end
