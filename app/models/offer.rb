class Offer < ApplicationRecord
  belongs_to :business
  enum :offer_type, {
    discount: 'discount',
    bogo: 'bogo',
    free: 'free'
  }, validate: true

  # Helper for form selects
  OFFER_TYPES = [
    ['discount', 'Discount'],
    ['bogo', 'Buy 1 Get 1'],
    ['free', 'Free Offer']
  ].freeze
end
