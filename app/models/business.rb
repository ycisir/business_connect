class Business < ApplicationRecord
  belongs_to :area
  belongs_to :category
  has_many :offers
  extend FriendlyId
  friendly_id :name, use: :slugged
end
