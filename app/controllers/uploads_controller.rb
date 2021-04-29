class UploadsController < ApplicationController
  before_action :authenticate_user!
  def index 
  end

  def import 
    Upload.import(params[:file])
    redirect_to root_url, notice: "Activity data imported!"
  end
end