class CreateTempData < ActiveRecord::Migration[6.1]
  def change
    create_table :temp_data do |t|
      t.string :column1
      t.string :column2
      t.string :column3
      t.string :column4
      t.string :column5
      t.string :column6
      t.string :column7
      t.string :column8

      t.timestamps
    end
  end
end
