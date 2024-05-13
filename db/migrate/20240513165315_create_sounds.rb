class CreateSounds < ActiveRecord::Migration[7.1]
  def change
    create_table :sounds do |t|
      t.string :file_path
      t.string :name
      t.string :type
      t.references :avatar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
