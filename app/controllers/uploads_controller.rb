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
    current_user.temp_datum.delete_all
    redirect_to uploads_path, notice: "The information was cleaned!"  
  end

  def imported_files
    @uploads = current_user.uploads
  end

  def save
    selected_options = params[:options]
    hash = convert_to_hash(selected_options)
    current_row = 1
    error_counter = 0
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
        error_counter += new_contact.errors.size
        save_errors(current_upload, new_contact, current_row)        
        current_user.contacts << (new_contact) if new_contact.valid?
        current_row += 1
    end
    setStatus(current_upload, error_counter)
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

  def setStatus(upload, total_errors)
    if total_errors > 0
      upload.status = 2
      upload.save
    else 
      upload.status = 1
      upload.save
    end
  end

  def save_errors(upload, contact, current_row)
    
    unless contact.errors[:name].empty?          
      contact.errors[:name].each do |msg|
        upd = UploadDetail.new(
          row: current_row,
          column: "name",
          data: "name #{msg}"
        )
        upload.upload_details << (upd) if upd.valid?
      end
    end

    unless contact.errors[:date_of_birth].empty?
      contact.errors[:date_of_birth].each do |msg|
        upd = UploadDetail.new(
          row: current_row,
          column: "date_of_birth",
          data: "date_of_birth #{msg}"
        )
        upload.upload_details << (upd) if upd.valid?
      end
    end

  end
  
end