class CreateIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :dscription
      t.references :user, foreign_key: true
    end
  end
end
