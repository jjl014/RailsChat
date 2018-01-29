json.array! @chats do |chat|
  next if chat.created_at + chat.timeout < Time.now()
  json.id chat.id
  json.text chat.text
end
