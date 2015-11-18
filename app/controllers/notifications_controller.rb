require 'twilio-ruby'

class NotificationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def self.notify(total)
    client = Twilio::REST::Client.new ENV["SID"], ENV["PIN"]
    message = client.messages.create from: ENV["PHONE"], to: ENV["WOW"], body: 'Thanks for your order sucka, you"re total is ' "#{total}"
  end

  def self.call
    client = Twilio::REST::Client.new ENV["SID"], ENV["PIN"]
    call = client.account.calls.create from: ENV["PHONE"], to: ENV["WOW"], url: "http://demo.twilio.com/docs/classic.mp3"
    # "http://twimlets.com/forward?PhoneNumber=303-638-2979&CallerId=720-903-1940&Timeout=10&FailUrl=http%3A%2F%2Ftwimlets.com%2Fmessage%3FMessage%255B0%255D%3DThank%2520you%2520for%"
  end

  def client
    Twilio::REST::Client.new ENV["SID"], ENV["PIN"]
  end


end
