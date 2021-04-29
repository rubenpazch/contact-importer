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

  def save
    selected_options = params[:options]
    hash = convert_to_hash(selected_options)

    current_user.temp_datum.all.each do |item|
        new_contact= Contact.new(
          name: item["column1"], ##'pedro',#item[selected_options.key?('name')],
          date_of_birth: "2020/02/19",
          phone: selected_options["column1"],
          address: hash.key('Address'),
          credit_card: '34534534534',
          franchise: 'SDFD',
          email: 'RUBEN@OUTLOOKC.OM',
        )
        current_user.contacts<<(new_contact)
    end
    
    
    redirect_to uploads_path, notice: "The information was saved!"  
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