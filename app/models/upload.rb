class Upload < ApplicationRecord
  require 'csv'
  belongs_to :user

  def self.import(file, current_user)    
    TempDatum.delete_all
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
    end
    
  end
end
