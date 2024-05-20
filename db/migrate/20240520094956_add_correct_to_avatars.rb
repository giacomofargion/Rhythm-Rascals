class AddCorrectToAvatars < ActiveRecord::Migration[7.1]
  def change
    rename_column :avatars, :correct_sounds, :correct
  end
end
