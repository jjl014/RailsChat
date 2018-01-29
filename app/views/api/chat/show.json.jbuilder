json.username @chat.username
json.text @chat.text
json.expiration_date (@chat.created_at - @chat.timeout).strftime("%Y-%m-%d %H:%M:%S")
