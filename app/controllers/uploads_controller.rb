class UploadsController < ApplicationController
  before_action :authenticate_user!
  def index 
    @temp_data = current_user.temp_datum.all    
  end

  def import         
    Upload.import(params[:file], current_user)
    redirect_to uploads_path, notice: "Activity data imported!"  
  end

  def clean
    current_user.temp_datum.clear
    redirect_to uploads_path, notice: "The information was cleaned!"  
  end

  def imported_files
    @uploads = current_user.uploads
  end

  def save
    selected_options = params[:options]
    hash = convert_to_hash(selected_options)
    current_row = 1
    current_upload = current_user.uploads.last

    current_user.temp_datum.all.each do |item|
        new_contact= Contact.new(
          name: item[ hash.key('name').to_s ],
          date_of_birth: "2020/02/19",
          phone: item[ hash.key('phone').to_s ],
          address: item[ hash.key('address').to_s ],
          credit_card: item[  hash.key('credit_card').to_s  ],
          franchise: 'SDFD',
          email: item[  hash.key('email').to_s  ],
        )
        new_contact.valid?
        
        unless new_contact.errors[:name].empty?
          new_contact.errors[:name].each do |msg|
            upd = UploadDetail.new(
              row: current_row,
              column: "name",
              data: "name #{msg}"
            )
            current_upload.upload_details << (upd) if upd.valid?
          end
        end

        unless new_contact.errors[:date_of_birth].empty?
          new_contact.errors[:date_of_birth].each do |msg|
            upd = UploadDetail.new(
              row: current_row,
              column: "date_of_birth",
              data: "date_of_birth #{msg}"
            )
            current_upload.upload_details << (upd) if upd.valid?
          end
        end
        
        current_user.contacts << (new_contact)
        current_row += 1
    end
    
    
    redirect_to imported_files_uploads_path, notice: "The information was saved!"  
  end

  private
  def convert_to_hash(list)
    h = Hash.new
    list.each do |item|
      h[item[0]] = item[1]
    end
    h
  end
  
end