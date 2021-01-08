class CreateShirts < ActiveRecord::Migration[6.0]
  def change
    create_table :shirts do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 5, scale: 2
      t.string :model

      t.timestamps
    end
  end
end
