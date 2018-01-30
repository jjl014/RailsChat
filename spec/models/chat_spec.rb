require 'rails_helper'

RSpec.describe Chat, type: :model do
  context 'validation tests' do
    it 'ensures username presence' do
      chat = Chat.new(text: "hello").save
      expect(chat).to eq(false)
    end

    it 'ensures text presence' do
      chat = Chat.new(username: "username").save
      expect(chat).to eq(false)
    end

    it 'should save successfully' do
      chat = Chat.new(username: "username", text: "hello").save
      expect(chat).to eq(true)
    end
  end
end
