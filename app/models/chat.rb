class Chat < ApplicationRecord
  validates :username, :text, presence: true

  # scope :expired, where('created_at <= ?', Time.now() - self.timeout)
  # scope :not_expired, where('created_at > ?', Time.now() - self.timeout)
end
