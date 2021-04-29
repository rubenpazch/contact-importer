class AddUploadToUploadDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :upload_details, :upload_id, :integer
  end
end
