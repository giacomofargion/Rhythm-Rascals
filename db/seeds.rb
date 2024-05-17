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
Sound.destroy_all
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

# Drummer Ben
#correct_sounds
sound1 = Sound.create(file_path: "../../assets/Bass-right.mp3", avatar_id: avatars[0].id, type_of_sound: "Bass")
sound2 = Sound.create(file_path: "../../assets/Beat-right.mp3", avatar_id: avatars[0].id, type_of_sound: "Beat")
sound3 = Sound.create(file_path: "../../assets/Chord-right.mp3", avatar_id: avatars[0].id, type_of_sound: "Harmony")
sound4 = Sound.create(file_path: "../../assets/Guitar-right.mp3", avatar_id: avatars[0].id, type_of_sound: "Melody")

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

# Miss Guitar Cone
#correct_sounds
sound1 = Sound.create(file_path: "../../assets/Bass-right.mp3", avatar_id: avatars[1].id, type_of_sound: "Bass")
sound2 = Sound.create(file_path: "../../assets/Beat-right.mp3", avatar_id: avatars[1].id, type_of_sound: "Beat")
sound3 = Sound.create(file_path: "../../assets/Chord-right.mp3", avatar_id: avatars[1].id, type_of_sound: "Harmony")
sound4 = Sound.create(file_path: "../../assets/Guitar-right.mp3", avatar_id: avatars[1].id, type_of_sound: "Melody")

puts "MGC Sounds created"
