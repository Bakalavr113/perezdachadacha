class RemoveMemeTypeFromMemes < ActiveRecord::Migration[5.2]
  def change
    remove_column :memes, :meme_type, :integer
  end
end
