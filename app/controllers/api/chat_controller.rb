class Api::ChatController < ApplicationController
  after_action :update_expired, only: [:index]

  def index
    @chats = Chat.where("username = ? AND expired = false", params[:username])
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
      render json: {id: @chat.id}, status: 201
    else
      render json: @chat.errors.full_messages, status: 422
    end
  end

  private

  def update_expired
    @chats.update_all(expired: true) unless @chats.empty?
  end
end
