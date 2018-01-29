class Chat < ApplicationRecord
  validates :username, :text, presence: true
end
