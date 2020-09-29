class MessagesController < ApplicationController

  # def new
  #   @message.new
  #   @messages = Message.all
  # end

  # def create
  #   @message = Message.new(message_params)
  #   if @message.save
  #     ActionCable.server.broadcast 'message_channel', content: @message
  #   end
  # end

  # private
  
  # def message_params
  #   params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  # end
  
end
