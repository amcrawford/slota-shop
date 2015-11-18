require 'twilio-ruby'

class NotificationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def self.notify(total)
    client = Twilio::REST::Client.new ENV["SID"], ENV["PIN"]
    message = client.messages.create from: ENV["PHONE"],
    to: ENV["WOW"], body: 'Thanks for your order sucka, you"re total is ' "#{total}"
  end

  def self.call
    client = Twilio::REST::Client.new ENV["SID"], ENV["PIN"]
    call = client.account.calls.create from: ENV["PHONE"],
    to: ENV["WOW"], url: "http://demo.twilio.com/docs/classic.mp3"
  end

  def client
    Twilio::REST::Client.new ENV["SID"], ENV["PIN"]
  end


end
