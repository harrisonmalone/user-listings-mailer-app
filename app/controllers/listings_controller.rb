class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index 
    @listings = Listing.all.limit(10)
  end

  def new 
    @listing = Listing.new
  end

  def show 
  end

  def create 
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      ListingMailer.send_listing_new_mail(current_user, @listing).deliver
      redirect_to listings_path
    else
      render :new
    end
  end

  private 

  def listing_params 
    params.require(:listing).permit(:name, :price)
  end
end
