class Chat < ApplicationRecord
  validates :username, :text, presence: true
  validates :timeout, numericality: true

  def self.cached_chat(id)
    Rails.cache.fetch([self,"chat-#{id}"], expires_in: 30.minutes.to_i) {
      Chat.find(id)
    }
  end
end
