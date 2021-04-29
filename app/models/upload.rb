class Upload < ApplicationRecord
  require 'csv'
  belongs_to :user
  has_many :upload_details

  def self.import(file, current_user)    
    TempDatum.delete_all
    total_items = 0
    CSV.foreach(file.path, headers: true) do |row|
      temp_datum = TempDatum.new(
        column1: row[0],
        column2: row[1],
        column3: row[2],
        column4: row[3],
        column5: row[4],
        column6: row[5],
        column7: "",
        column8: ""
      )
      current_user.temp_datum << temp_datum
      total_items += 1
    end

    date = Time.new
    date_string = date.day.to_s + "_" + date.month.to_s + "_" + date.year.to_s + "_" + date.hour.to_s + "_" + date.min.to_s + "_" + date.sec.to_s
    
    upload_item = Upload.new(
      name:"csv_file_#{ date_string }",
      total_items: total_items,
      status: 1
    )
    
    current_user.uploads<<(upload_item)
    upload_item
  end


end
