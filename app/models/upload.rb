class Upload < ApplicationRecord
  require 'csv'

  def self.import(file)
    #arr = Array.new
    @data = Data.new
    CSV.foreach(file.path, headers: true) do |row|
      @data.addRow(row)
      #arr.push(row)      
      #Contact.create! row.to_hash
    end
    @data.save
    @data
  end
end
