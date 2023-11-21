class Client < ApplicationRecord
	has_one :address, dependent: :destroy, inverse_of: :client

	accepts_nested_attributes_for :address
end
