class CreateIdeasGifsjoinTable < ActiveRecord::Migration[5.1]
  def change
     create_join_table :ideas, :gifs
  end
end
