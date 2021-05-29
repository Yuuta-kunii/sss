class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'room_channel', message: render_mesaage(message)
  end
  
  private
  
  def render_mesaage(message)
    ApplicationController.renderer.render(partial: "messages/message",locals:{message: message})
  end
end
