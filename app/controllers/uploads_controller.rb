class UploadsController < ApplicationController
  before_action :authenticate_user!
  def index 
    @data = Data.new.getData
  end

  def import         
    @data = Upload.import(params[:file])
    redirect_to uploads_path, notice: "Activity data imported!"
  end
end