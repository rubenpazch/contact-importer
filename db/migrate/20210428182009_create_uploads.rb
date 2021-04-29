class CreateUploads < ActiveRecord::Migration[6.1]
  def change
    create_table :uploads do |t|
      t.integer :status
      t.integer :total_items

      t.timestamps
    end
  end
end
