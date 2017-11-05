class BookingMailer < ApplicationMailer
  def created(booking, email = nil)
    email ||= 'ali.ariff12@gmail.com'
    mail :to => email, :subject => "Booking Created ##{booking.id}"
  end
end
