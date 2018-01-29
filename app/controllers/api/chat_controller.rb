class Api::ChatController < ApplicationController
  def index
    @chats = Chat.all
    render :index
  end

  def show
    @chat = Chat.find(params[:id])
    if @chat
      render :show, status: 200
    else
      render text: "404 Not Found", status: 404
    end
  end

  def create
    @chat = Chat.new(
      username: params[:username],
      text: params[:text],
      timeout: params[:timeout] || 60
    )
    if @chat.save
      render json: {"id" => @chat.id}, status: 201
    else
      render json: @chat.errors.full_messages, status: 422
    end
  end
end
