class CreateNytimesIdeasJoinTable < ActiveRecord::Migration[5.1]
  def change
         create_join_table :ideas, :nytimes
  end
end
