class Business < ApplicationRecord
  belongs_to :area
  belongs_to :category
  extend FriendlyId
  friendly_id :name, use: :slugged
end
