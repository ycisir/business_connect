# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts "Creating categories..."
categories = %w(Restaurants Cafes Grocery Beauty\ &\ Salon Health Fitness Fashion Electronics Home\ Services Automotive Education Travel)

categories.each do |c|
	Category.create(name: c)
end

puts "#{Category.count} categories created."


puts "Creating areas..."

areas = %w(Kamptee Old\ Kamptee Sadar\ Bazar Gandhi\ Chowk Railway\ Colony Gaddigodam Kalamna\ Road Dragon\ Palace Bhilgaon Kanhan Khairi Koradi Wadi)
areas.each do |a|
	Area.create(name: a)
end

puts "#{Area.count} areas created."

puts "Creating businesses..."

adjectives = %w(Royal Star New City Lucky Golden Fresh Smart Classic)
nouns = ["Biryani", "Cafe", "Mart", "Salon", "Gym", "Fashion", "Mobile", "Clinic", "Garage", "Bakery"]

30.times do
  category = Category.order("RANDOM()").first
  area = Area.order("RANDOM()").first

  Business.create!(
    name: "#{adjectives.sample} #{nouns.sample}",
    description: "Quality #{category.name.downcase} services in #{area.name}.",
    category: category,
    area: area,
    phone: "98#{rand(10000000..99999999)}",
    whatsapp: "91#{rand(7000000000..9999999999)}",
    instagram: "https://instagram.com/example",
    featured: [true, false, false].sample
  )
end

puts "#{Business.count} businesses created."

puts "Creating offers..."

Business.all.sample(12).each do |business|
  Offer.create!(
    business: business,
    title: [
      "10% OFF",
      "20% Discount",
      "Buy 1 Get 1",
      "Free Consultation",
      "Free Delivery"
    ].sample,
    offer_type: Offer.offer_types.keys.sample,
    is_active: true,
    expires_at: Date.today + rand(15..60).days
  )
end

puts "#{Offer.count} offers created."