# encoding: utf-8

class IncomingEmailController < ApplicationController
  def register
    if InboundEmail.create(:message_data => request.body.read)
      render :text => "Created a post!", status: :created
    else
      render :text => "Failed!", status: :failed
    end
  end

  def bounce
    if InboundEmail.create(:message_data => request.body.read)
      render :text => "Created a post!", status: :created
    else
      render :text => "Failed!", status: :failed
    end
  end
end
