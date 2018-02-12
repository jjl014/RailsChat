require 'rails_helper'

RSpec.describe Api::ChatController, type: :controller do
  describe "GET #show" do
    context "if the chat exists" do
      it "responds with success" do
        chat = Chat.create(username: "username", text: "hello")
        get :show, {format: :json, params:{id: chat.id}}
        expect(response).to have_http_status(200)
      end
    end

    context "if the chat doesn't exist" do
      it "is not a success" do
        get :show, {format: :json, params:{id: -1}}
        expect(response).to have_http_status(404)
      end
    end

  end

  describe "GET #index" do
    it "responds with success" do

    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "responds with 404 error"
    end

    context "with valid params" do
      it "responds with success"
    end
  end
end
