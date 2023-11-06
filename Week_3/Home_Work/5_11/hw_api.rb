# frozen_string_literal: true

hw_api.rb

require 'faraday'

conn = Faraday.new(url: 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users')

# # lay thong tin user
response = conn.get do |req|
  req.params['active'] = 'true'
end

p response

tao user

user = {
  'name' => 'Nguyen',
  'sex' => 'male',
  'created_at' => DateTime.now.to_s,
  'avatar' => 'https://www.google.com/search?q=aure&sca_esv=579669660&hl=vi&tbm=isch&sxsrf=AM9HkKlaBBScaf9J_1VmnW2S5iVeVQeVUg:1699231424641&source=lnms&sa=X&ved=2ahUKEwibyNOrkq6CAxXG4jgGHZ06A1MQ_AUoAXoECAIQAw&biw=1633&bih=928&dpr=1.8#imgrc=EMR9t26VaUFrpM'
}

respone = conn.post do |req|
  req.headers['Content-Type'] = 'application/json'
  req.body = user.to_json
end
p respone

# xoa user

user_id = 188
response = conn.delete "/users/#{user_id}"

if response.status == 200
  puts "Người dùng với ID #{user_id} đã được xóa thành công."
else
  puts 'Không thể xóa người dùng.'
end
