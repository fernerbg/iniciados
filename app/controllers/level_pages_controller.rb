class LevelPagesController < ApplicationController
  
  before_action :levels_root
  
  def new
    gon.upload_path = url_for(action: 'create')
  end
  
  def create
    directory_name = "#{levels_root}/#{params[:file_path]}"
    FileUtils.mkdir_p directory_name
    params[:pieces].each_with_index do |piece, index|
      File.open("#{directory_name}/#{index + 1}.jpg", "w") do |output|
        output.print piece
      end
    end
    respond_to do |format|
      format.json do
        render json: { success: true }
      end
    end
    
    
  end
  
  private
    def levels_root
      "#{private_root}/levels"
    end
    
    def level_page_params
      params.require(:level_page).permit(:number, :level_id)
    end
  
end