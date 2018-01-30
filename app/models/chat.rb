# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  text       :string           not null
#  timeout    :integer          default(60)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  expired    :boolean          default(FALSE)
#

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
      chat = Chat.new(username: username, text: text, timeout: timeout)
      chat
    }
  end
end
