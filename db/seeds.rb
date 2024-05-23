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
  { name: 'GuGu Berry', image_url: 'berry.jpg', description: 'The Master Blaster.' },
  { name: 'Cakey', image_url: 'cakey.jpg', description: 'The sweetest superstar around!' },
  { name: 'Trumpet', image_url: 'trumpet.jpg', description: 'Blasts out tunes that make everyone dance!' },
  { name: 'Mr Cheese', image_url: 'mr-cheese.jpg', description: 'Always up for a cheesy joke and a good time!' }
])

puts "Created #{avatars.size} avatars."

#DRUMMER BEN - AVATAR 1

file = File.open("app/assets/audio/Bass-right.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound7 = Sound.create(file_path: result['url'], avatar_id: avatars[0].id, type_of_sound: "Bass")

file = File.open("app/assets/audio/Beat-wrong1.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound2 = Sound.create(file_path: result['url'], avatar_id: avatars[0].id, type_of_sound: "Beat")

file = File.open("app/assets/audio/Chord-wrong2.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound3 = Sound.create(file_path: result['url'], avatar_id: avatars[0].id, type_of_sound: "Harmony")

file = File.open("app/assets/audio/Guitar-wrong3.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound4 = Sound.create(file_path: result['url'], avatar_id: avatars[0].id, type_of_sound: "Melody")

file = File.open("app/assets/audio/Bass-wrong1.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound5 = Sound.create(file_path: result['url'], avatar_id: avatars[0].id, type_of_sound: "Bass")

file = File.open("app/assets/audio/Beat-wrong2.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound6 = Sound.create(file_path: result['url'], avatar_id: avatars[0].id, type_of_sound: "Beat")

file = File.open("app/assets/audio/Chord-right.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound1 = Sound.create(file_path: result['url'], avatar_id: avatars[0].id, type_of_sound: "Harmony")

file = File.open("app/assets/audio/Guitar-right.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound8 = Sound.create(file_path: result['url'], avatar_id: avatars[0].id, type_of_sound: "Melody")

file = File.open("app/assets/audio/Bass-wrong3.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound9 = Sound.create(file_path: result['url'], avatar_id: avatars[0].id, type_of_sound: "Bass")

file = File.open("app/assets/audio/Beat-right.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound10 = Sound.create(file_path: result['url'], avatar_id: avatars[0].id, type_of_sound: "Beat")

file = File.open("app/assets/audio/Chord-wrong1.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound11 = Sound.create(file_path: result['url'], avatar_id: avatars[0].id, type_of_sound: "Harmony")

file = File.open("app/assets/audio/Guitar-wrong1.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound12 = Sound.create(file_path: result['url'], avatar_id: avatars[0].id, type_of_sound: "Melody")

file = File.open("app/assets/audio/Bass-wrong2.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound13 = Sound.create(file_path: result['url'], avatar_id: avatars[0].id, type_of_sound: "Bass")

file = File.open("app/assets/audio/Beat-wrong3.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound14 = Sound.create(file_path: result['url'], avatar_id: avatars[0].id, type_of_sound: "Beat")

file = File.open("app/assets/audio/Chord-wrong3.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound15 = Sound.create(file_path: result['url'], avatar_id: avatars[0].id, type_of_sound: "Harmony")

file = File.open("app/assets/audio/Guitar-wrong2.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound16 = Sound.create(file_path: result['url'], avatar_id: avatars[0].id, type_of_sound: "Melody")

avatars[0].update(correct: "#{sound7.id}, #{sound10.id}, #{sound1.id}, #{sound8.id}")



#Miss Guitar Cone - AVATAR 2


file = File.open("app/assets/audio/A2Bass-wrong1.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound21 = Sound.create(file_path: result['url'], avatar_id: avatars[1].id, type_of_sound: "Bass")

file = File.open("app/assets/audio/A2Beat-wrong3.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound30 = Sound.create(file_path: result['url'], avatar_id: avatars[1].id, type_of_sound: "Beat")

#Correct Sound
file = File.open("app/assets/audio/A2Chord-right.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound19 = Sound.create(file_path: result['url'], avatar_id: avatars[1].id, type_of_sound: "Harmony")

#Correct Sound
file = File.open("app/assets/audio/A2Melody-right.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound20 = Sound.create(file_path: result['url'], avatar_id: avatars[1].id, type_of_sound: "Melody")


file = File.open("app/assets/audio/A2Bass-wrong2.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound25 = Sound.create(file_path: result['url'], avatar_id: avatars[1].id, type_of_sound: "Bass")

file = File.open("app/assets/audio/A2Beat-wrong1.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound22 = Sound.create(file_path: result['url'], avatar_id: avatars[1].id, type_of_sound: "Beat")

file = File.open("app/assets/audio/A2Chord-wrong1.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound23 = Sound.create(file_path: result['url'], avatar_id: avatars[1].id, type_of_sound: "Harmony")

file = File.open("app/assets/audio/A2Melody-wrong1.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound24 = Sound.create(file_path: result['url'], avatar_id: avatars[1].id, type_of_sound: "Melody")


#Correct Sound
file = File.open("app/assets/audio/A2Bass-right.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound17 = Sound.create(file_path: result['url'], avatar_id: avatars[1].id, type_of_sound: "Bass")

file = File.open("app/assets/audio/A2Beat-wrong2.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound26 = Sound.create(file_path: result['url'], avatar_id: avatars[1].id, type_of_sound: "Beat")


file = File.open("app/assets/audio/A2Chord-wrong2.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound27 = Sound.create(file_path: result['url'], avatar_id: avatars[1].id, type_of_sound: "Harmony")

file = File.open("app/assets/audio/A2Melody-wrong2.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound28 = Sound.create(file_path: result['url'], avatar_id: avatars[1].id, type_of_sound: "Melody")



file = File.open("app/assets/audio/A2Bass-wrong3.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound29 = Sound.create(file_path: result['url'], avatar_id: avatars[1].id, type_of_sound: "Bass")

#Correct Sound
file = File.open("app/assets/audio/A2Beat-right.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound18 = Sound.create(file_path: result['url'], avatar_id: avatars[1].id, type_of_sound: "Beat")


file = File.open("app/assets/audio/A2Chord-wrong3.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound31 = Sound.create(file_path: result['url'], avatar_id: avatars[1].id, type_of_sound: "Harmony")

file = File.open("app/assets/audio/A2Melody-wrong3.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound32 = Sound.create(file_path: result['url'], avatar_id: avatars[1].id, type_of_sound: "Melody")

avatars[1].update(correct: "#{sound17.id}, #{sound18.id}, #{sound19.id}, #{sound20.id}")


#Blob with Many Eyes - AVATAR 3


file = File.open("app/assets/audio/A3Bass-wrong2.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound41 = Sound.create(file_path: result['url'], avatar_id: avatars[2].id, type_of_sound: "Bass")

#Correct Sound
file = File.open("app/assets/audio/A3Beat-right.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound34 = Sound.create(file_path: result['url'], avatar_id: avatars[2].id, type_of_sound: "Beat")

file = File.open("app/assets/audio/A3Chord-wrong1.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound39 = Sound.create(file_path: result['url'], avatar_id: avatars[2].id, type_of_sound: "Harmony")

#Correct Sound
file = File.open("app/assets/audio/A3Melody-right.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound36 = Sound.create(file_path: result['url'], avatar_id: avatars[2].id, type_of_sound: "Melody")

file = File.open("app/assets/audio/A3Bass-wrong3.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound45 = Sound.create(file_path: result['url'], avatar_id: avatars[2].id, type_of_sound: "Bass")

file = File.open("app/assets/audio/A3Beat-wrong1.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound37 = Sound.create(file_path: result['url'], avatar_id: avatars[2].id, type_of_sound: "Beat")

file = File.open("app/assets/audio/A3Chord-wrong2.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound43 = Sound.create(file_path: result['url'], avatar_id: avatars[2].id, type_of_sound: "Harmony")

file = File.open("app/assets/audio/A3Melody-wrong3.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound47 = Sound.create(file_path: result['url'], avatar_id: avatars[2].id, type_of_sound: "Melody")

#Correct Sound
file = File.open("app/assets/audio/A3Bass-right.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound33 = Sound.create(file_path: result['url'], avatar_id: avatars[2].id, type_of_sound: "Bass")

file = File.open("app/assets/audio/A3Beat-wrong3.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound42 = Sound.create(file_path: result['url'], avatar_id: avatars[2].id, type_of_sound: "Beat")

#Correct Sound
file = File.open("app/assets/audio/A3Chord-right.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound35 = Sound.create(file_path: result['url'], avatar_id: avatars[2].id, type_of_sound: "Harmony")

file = File.open("app/assets/audio/A3Melody-wrong1.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound40 = Sound.create(file_path: result['url'], avatar_id: avatars[2].id, type_of_sound: "Melody")

file = File.open("app/assets/audio/A3Bass-wrong1.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound38 = Sound.create(file_path: result['url'], avatar_id: avatars[2].id, type_of_sound: "Bass")

file = File.open("app/assets/audio/A3Beat-wrong2.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound44 = Sound.create(file_path: result['url'], avatar_id: avatars[2].id, type_of_sound: "Beat")

file = File.open("app/assets/audio/A3Chord-wrong3.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound48 = Sound.create(file_path: result['url'], avatar_id: avatars[2].id, type_of_sound: "Harmony")

file = File.open("app/assets/audio/A3Melody-wrong2.mp3", 'rb')
result = Cloudinary::Uploader.upload(file, resource_type: :video)
sound46 = Sound.create(file_path: result['url'], avatar_id: avatars[2].id, type_of_sound: "Melody")



avatars[2].update(correct: "#{sound33.id}, #{sound34.id}, #{sound35.id}, #{sound36.id}")
