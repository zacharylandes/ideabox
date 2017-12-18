class AddImageIdToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_reference :ideas, :image, foreign_key: true
  end
end
