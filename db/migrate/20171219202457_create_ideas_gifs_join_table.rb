class CreateIdeasGifsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :Ideas, :Gifs do |t|
      # t.index [:idea_id, :gif_id]
      # t.index [:gif_id, :idea_id]
    end
  end
end
