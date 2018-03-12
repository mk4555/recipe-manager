class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :rating
      t.integer :cook_time
      t.text :description
      t.integer :user_id
    end
  end
end
