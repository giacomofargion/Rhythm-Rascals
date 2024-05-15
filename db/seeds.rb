# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
# db/seeds.rb
avatars = Avatar.create([
    { name: 'Drummer Ben', image_url: 'huluhooloi.svg', description: 'Loves a good beat.' },
    { name: 'Guitar Cone', image_url: 'ms_cone.svg', description: 'Strums faster than you can blink.' },
    { name: 'GuGu Berry', image_url: 'berry.svg', description: 'Master Blaster' }
  # Add more avatars as needed
])
puts "Created #{avatars.size} avatars."
#   end
