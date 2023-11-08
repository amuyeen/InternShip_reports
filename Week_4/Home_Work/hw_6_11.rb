#  cho 1 API với endpoint như sau:
# - https://6418014ee038c43f38c45529.mockapi.io/api/v1/users
# - API này tuân theo chuẩn restful api (cái này sẽ được tìm hiểu sau)
# - API này cung cấp: lấy list user, thêm/xoá/sửa 1 user (CURD -> create update read delete)
# - method: GET, path: api/v1/users, response: User[], desc: Get a list of users
# - method: GET, path: api/v1/users/{id}, response: User, desc: Get a user by ID
# - method: POST, path: api/v1/users, response: User, desc: Create a new user
# - method: PUT (or PATCH), path: api/v1/users/{id}, response: User, desc: Update a user
# - method: Delete, path: api/v1/users/{id}, response: User, desc: Delete a user
# - Đối tượng User bao gồm các thuộc tính sau:
# - id: kiểu số nguyên, id của người dùng
# - name: kiểu chuỗi, tên của người dùng
# - avatar: kiểu chuỗi, link tới ảnh của người dùng
# - sex: kiểu chuỗi, giới tính của người dùng (male, female)
# - active: kiểu true/false
# - created_at: kiểu chuỗi, thời gian người dùng được tạo
# - ví dụ: { “created_at”:“2023-03-19T21:50:37.741Z”, “name”:“Kristen Trantow I”, “avatar”:“ https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1145.jpg”;, “sex”:“male”, “id”:“1” }
# - Task này yêu cầu sử dụng gem faraday để connect tới API này và làm những chức năng sau:
# - Lấy tất cả các user với thuộc tính active là true
# - Tạo một user mới với tên, giới tính là tên và giới tính của mình, ngày tạo là ngày hiện tại, avatar có thể là một đường link bất kỳ




require'Faraday'
require'Caracal'
require'json'


class User
	API_URL = 'https://6418014ee038c43f38c45529.mockapi.io/api/v1/users'

	attr_accessor :id , :name, :sex, :active, :avatar, :created_at


	def initialize(attribute)
		puts attribute 

		@id = attribute[:id]
		@name = attribute[:name]
		@sex = attribute[:sex]
		 @active = attribute[:active]
		 @avatar = attribute[:avatar]
		 @created_at = attribute[:created_at]
		 @connection = connection
		 @user_data = {}
	end

	def self.active_users
		response = Faraday.new(url: API_URL).get do |req|
 			req.params['active'] = true 
		end

		return JSON.parse(response.body) if response.success?

		[]
	end

	def self.info_users
		response = Faraday.new(url: API_URL).get
		@user_data = JSON.parse(response.body)

		response.success?
	end	

	def self.setting_table(docx) 	
		docx.table @user_data, border_size: 4 do 
			border_top do 
				color		'000000'
				line		:double
				size    8
				spacing 2
			end
		end
	end

	def self.create_table
		@user_data.map(&:values)
			headers = %w[Id Name Sex Active Avatar Created_at]
	    data = [headers] + @user_data.map do |value|
	      [
	        value['id'],
	        value['name'],
	        value['sex'],
	        value['active'],
	        value['avatar'],
	        value['created_at']
	      ]
	    end

		  Caracal::Document.save 'example.docx' do |docx|
      docx.table data, border_size: 4 do
        border_top do
          color   '000000'
          line    :double
          size    8
          spacing 2
        end
      end

    end
	end

	def create
		response = @connection.post do |req|
			req.headers['Content-Type'] = 'application/json'
			req.body = data
		end

		response.success?
	end

	def update
		response = @connection.put do |req|
			req.headers['Content-Type'] = 'application/json'
			req.url @id
			req.body = data 
		end

		response.success?
	end


	def delete
		response = @connection.delete do |req|
			req.url @id
		end

		response.success?
	end


	private


	def connection
		@connection ||= Faraday.new(url: API_URL)
	end

	def data
		{}.tap do |attributes|
			attributes[:id] = @id unless @id.to_s.empty?
			attributes[:name] = @name unless @name.to_s.empty?
			attributes[:sex] = @sex unless @sex.to_s.empty?
			attributes[:active] = @active unless @name.to_s.empty?
			attributes[:avatar] = @avatar unless @name.to_s.empty?
			attributes[:created_at] = @created_at unless @name.to_s.empty?	
		end.to_json
	end
 end


# user = User.new({:id => "123", :name => "Nguyen", :sex => "male", :active => "true", :created_at => "asd", :avatar => "new"} ) 
User.info_users
User.create_table

