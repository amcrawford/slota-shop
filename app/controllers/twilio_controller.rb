require "twilio-ruby"

class TwilioController < ApplicationController
  include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token

  def voice
  	response = Twilio::TwiML::Response.new do |r|
  	  r.Say "Hey there. Congrats!", :voice => "alice"
        r.Play "http://linode.rabasa.com/cantina.mp3"
  	end
  	render_twiml response
  end
end
