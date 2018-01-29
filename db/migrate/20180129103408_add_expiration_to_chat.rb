class AddExpirationToChat < ActiveRecord::Migration[5.1]
  def change
    add_column :chats, :expired, :boolean, default: false
  end
end
