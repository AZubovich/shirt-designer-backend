class ChangeModelFromStringToText < ActiveRecord::Migration[6.0]
  def change
  	change_column :shirts, :model, :text
  end
end
