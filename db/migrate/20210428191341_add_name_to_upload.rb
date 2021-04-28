class AddNameToUpload < ActiveRecord::Migration[6.1]
  def change
    add_column :uploads, :name, :string
  end
end
