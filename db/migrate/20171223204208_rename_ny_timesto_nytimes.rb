class RenameNyTimestoNytimes < ActiveRecord::Migration[5.1]
  def change
         rename_table :ny_times, :nytimes

  end
end
