class CreateUploadDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :upload_details do |t|
      t.integer :row
      t.integer :column
      t.string :data
      t.text :error

      t.timestamps
    end
  end
end
