class AddUserToTempData < ActiveRecord::Migration[6.1]
  def change
    add_column :temp_data, :user_id, :integer
  end
end
