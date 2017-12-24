class Createnytimes < ActiveRecord::Migration[5.1]
  def change
    create_table :ny_times do |t|
      t.string :title
      t.string :url
    end
  end
end
