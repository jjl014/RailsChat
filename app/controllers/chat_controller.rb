class ChatController < ApplicationController
  after_action :update_expired, only: [:index]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  def index
    @chats = Chat.where("username = ? AND expired = false", params[:username])
    render :index
  end

  def show
    @chat = Chat.cached_chat(params[:id])
    if @chat
      render :show, status: 200
    else
      render plain: "404 Not Found", status: 404
    end
  end

  def create
    @chat = Chat.new(
      username: params[:username],
      text: params[:text],
      timeout: params[:timeout]
    )
    if @chat.save
      render json: {id: @chat.id}, status: 201
    else
      render json: @chat.errors.full_messages, status: 422
    end
  end

  protected

  def not_found
    render plain: "404 Not Found", status: 404
  end

  private

  # Update all the received chats to expired
  def update_expired
    @chats.update_all(expired: true) unless @chats.empty?
  end
end
