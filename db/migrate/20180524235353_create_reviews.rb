class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :recipe
      t.belongs_to :user
      t.text :body
    end
  end
end
