class CreateNytimes < ActiveRecord::Migration[5.1]
  def change
    create_table :nytimes do |t|
      t.string :title
      t.string :url
    end
  end
end
