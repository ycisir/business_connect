class Area < ApplicationRecord
	has_many :businesses
	extend FriendlyId
	friendly_id :name, use: :slugged
end
