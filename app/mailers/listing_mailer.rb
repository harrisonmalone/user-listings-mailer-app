class ListingMailer < ApplicationMailer
  def send_listing_new_mail(user, listing)
    @user = user
    @listing = listing
    mail(to: @user.email, subject: 'Thanks for creating a new listing')
  end
end
