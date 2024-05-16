# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
# db/seeds.rb
# db/seeds.rb

# Step 1: Delete all instances
Avatar.destroy_all

# Step 2: Reset primary key sequence (for PostgreSQL)
# This line is specific to PostgreSQL and ensures that the primary key sequence is reset.
ActiveRecord::Base.connection.reset_pk_sequence!('avatars')

# Step 3: Repopulate the database with new records
avatars = Avatar.create!([
  { name: 'Drummer Ben', image_url: 'huluhooloi.svg', description: 'Loves a good beat.' },
  { name: 'Miss Guitar Cone', image_url: 'ms_cone.svg', description: 'Strums faster than you can blink.' },
  { name: 'Blob with Many Eyes', image_url: 'blob.svg', description: 'Sees everything, misses nothing.' },
  { name: 'Mr. Apple with Mustache', image_url: 'appleman.svg', description: 'The most dapper fruit in the basket.' },
  { name: 'GuGu Berry', image_url: 'berry.svg', description: 'The Master Blaster.' }
])

puts "Created #{avatars.size} avatars."

#   end
