class CreateDirections < ActiveRecord::Migration[5.1]
  def change
    create_table :directions do |t|
      t.belongs_to :recipe
      t.string :direction
    end
  end
end
