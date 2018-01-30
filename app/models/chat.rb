class Chat < ApplicationRecord
  validates :username, :text, presence: true
  validates :timeout, numericality: true

  def self.cached_chat(id)
    Rails.cache.fetch([self, "chat-#{id}"], expires_in: 30.minutes.to_i) {
      Chat.find(id)
    }
  end

  def self.cached_create_chat(username, text, timeout)
    Rails.cache.write( username, expires_in: timeout.to_i.seconds.to_i) {
      Chat.new(username: username, text: text, timeout: timeout)
    }
    chat
  end
end
