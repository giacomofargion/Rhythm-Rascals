class AddImageUrlToAvatars < ActiveRecord::Migration[7.1]
  def change
    add_column :avatars, :image_url, :string
  end
end
