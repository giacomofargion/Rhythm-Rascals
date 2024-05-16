class RenameTypeColumnInSounds < ActiveRecord::Migration[7.1]
  def change
    rename_column :sounds, :type, :type_of_sound
  end
end
