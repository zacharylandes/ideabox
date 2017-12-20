class CreateGifs < ActiveRecord::Migration[5.1]
  def change
    create_table :gifs do |t|
      t.string :name
      t.string :url
      t.references :idea, foreign_key: true
    end
  end
end
