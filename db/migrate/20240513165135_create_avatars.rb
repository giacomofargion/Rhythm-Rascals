class CreateAvatars < ActiveRecord::Migration[7.1]
  def change
    create_table :avatars do |t|
      t.string :name
      t.text :description
      t.string :correct_sounds

      t.timestamps
    end
  end
end
