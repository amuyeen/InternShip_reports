class Post < ApplicationRecord
	enum :status, [:published, :draft, :archived]
end
