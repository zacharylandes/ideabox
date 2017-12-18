class CreateJoinTableIdeaImage < ActiveRecord::Migration[5.1]
  def change
    create_join_table :ideas, :images do |t|
      # t.index [:idea_id, :image_id]
      # t.index [:image_id, :idea_id]
    end
  end
end
