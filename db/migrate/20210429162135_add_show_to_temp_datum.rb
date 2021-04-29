class AddShowToTempDatum < ActiveRecord::Migration[6.1]
  def change
    add_column :temp_data, :show, :boolean
  end
end
