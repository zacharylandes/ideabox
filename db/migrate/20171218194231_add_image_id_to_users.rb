class AddImageIdToUsers < ActiveRecord::Migration[5.1]
  def change
      add_reference :users, :image, foreign_key: true
  end
end
