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
require 'cloudinary'

# Step 1: Delete all instances
Sound.destroy_all
Avatar.destroy_all



# Step 2: Reset primary key sequence (for PostgreSQL)
# This line is specific to PostgreSQL and ensures that the primary key sequence is reset.
ActiveRecord::Base.connection.reset_pk_sequence!('avatars')

# Step 3: Repopulate the database with new records
avatars = Avatar.create!([
  { name: 'Drummer Ben', image_url: 'huluhooloi.jpg', description: 'Loves a good beat.' },
  { name: 'Miss Guitar Cone', image_url: 'ms_cone.jpg', description: 'Strums faster than you can blink.' },
  { name: 'Blob with Many Eyes', image_url: 'blob.jpg', description: 'Sees everything, misses nothing.' },
  { name: 'Mr. Apple with Mustache', image_url: 'appleman.jpg', description: 'The most dapper fruit in the basket.' },
  { name: 'GuGu Berry', image_url: 'berry.jpg', description: 'The Master Blaster.' }
])

puts "Created #{avatars.size} avatars."

#correct_sounds
file = File.open("app/assets/audio/Bass-right.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound1 = Sound.create(file_path: result['url'], avatar_id: avatars[0].id, type_of_sound: "Bass")

sound2 = Sound.create(file_path: "../../assets/Beat-right.mp3", avatar_id: avatars[0].id, type_of_sound: "Beat")
sound3 = Sound.create(file_path: "../../assets/Chord-right.mp3", avatar_id: avatars[0].id, type_of_sound: "Harmony")
sound4 = Sound.create(file_path: "../../assets/Guitar-right.mp3", avatar_id: avatars[0].id, type_of_sound: "Melody")

avatars[0].update(correct: "#{sound1.id}, #{sound2.id}, #{sound3.id}, #{sound4.id}")

#WRONG SOUNDS
sound5 = Sound.create(file_path: "../../assets/Bass-wrong1.mp3", avatar_id: avatars[0].id, type_of_sound: "Bass")
sound6 = Sound.create(file_path: "../../assets/Beat-wrong1.mp3", avatar_id: avatars[0].id, type_of_sound: "Beat")
sound7 = Sound.create(file_path: "../../assets/Chord-wrong1.mp3", avatar_id: avatars[0].id, type_of_sound: "Harmony")
sound8 = Sound.create(file_path: "../../assets/Guitar-wrong1.mp3", avatar_id: avatars[0].id, type_of_sound: "Melody")

sound9 = Sound.create(file_path: "../../assets/Bass-wrong2.mp3", avatar_id: avatars[0].id, type_of_sound: "Bass")
sound10 = Sound.create(file_path: "../../assets/Beat-wrong2.mp3", avatar_id: avatars[0].id, type_of_sound: "Beat")
sound11 = Sound.create(file_path: "../../assets/Chord-wrong2.mp3", avatar_id: avatars[0].id, type_of_sound: "Harmony")
sound12 = Sound.create(file_path: "../../assets/Guitar-wrong2.mp3", avatar_id: avatars[0].id, type_of_sound: "Melody")

sound13 = Sound.create(file_path: "../../assets/Bass-wrong3.mp3", avatar_id: avatars[0].id, type_of_sound: "Bass")
sound14 = Sound.create(file_path: "../../assets/Beat-wrong3.mp3", avatar_id: avatars[0].id, type_of_sound: "Beat")
sound15 = Sound.create(file_path: "../../assets/Chord-wrong3.mp3", avatar_id: avatars[0].id, type_of_sound: "Harmony")
sound16 = Sound.create(file_path: "../../assets/Guitar-wrong3.mp3", avatar_id: avatars[0].id, type_of_sound: "Melody")
