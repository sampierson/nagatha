class IncomingEmailController < ApplicationController

  def receive
    Rails.logger.info("SAM received email: #{params.inspect}")
  end
end
