class LevelPagesController < InheritedResources::Base
  
  def create
    @page = LevelPage.new(level_page_params)
    @page.save
    respond_to do |format|
      format.html do
        respond_with @page
      end
      format.json do
        render json: [@page.id, @page.number]
      end
    end
  end
  
  def show
    @page = LevelPage.where(level_id: params[:level_id], number: params[:number]).first
    base_64 = Base64.encode64(File.read(@page.image.current_path)).gsub("\n", '')
    @data = "data:image/jpg;base64,#{base_64}"
    respond_to do |format|
      format.html
      format.json do
        data = @data
        render json: {image: data}
      end
    end
  end
  
  private
    def level_page_params
      params.require(:level_page).permit(:image, :number, :level_id)
    end
end

