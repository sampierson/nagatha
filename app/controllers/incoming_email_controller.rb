class IncomingEmailController < ApplicationController

  def receive
    Rails.logger.info("SAM received email: #{params.inspect}")
    head :ok
  end
end
