class API
  def initialize(connect)
    @connect = Faraday.new(connect)
    @response = ''
  end

  def active_user
    @response = @connect.get do |req|
      req.url '/users'
      req.params['active'] = true
    end
  end

  def delete_user(id)

    @connect.delete("/users/#{id}")
  end

  def create_user(hash)
    @response = @connect.post do |req|
      req.url 'users'
      req.headers['Content-Type'] = 'application/json'
      req.body = JSON.generate(hash)
    end
  end

  def print_user
    if @response.success?
      users = JSON.parse(@response.body)
      users.each do |user|
        puts "ID: #{user['id']},\nTên: #{user['name']},\nGiới tính: #{user['sex']},\n" \
   "Trạng thái: #{user['active']},\nNgày tạo: #{user['created_at']},\n" \
   "Hình ảnh: #{user['avatar']}\n\n"
      end
    else
      puts 'Error: User do not find'
    end
  end
end

api = API.new('https://6418014ee038c43f38c45529.mockapi.io/api/v1/')
api.active_user
api.print_user
api.delete_user('211')
api.create_user({ name: 'Nguyen', avatar: nil, sex: 'male', active: false })