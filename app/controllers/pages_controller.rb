class PagesController < InheritedResources::Base
  
  def create
    @page = Page.new(page_params)
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
  
  private
    def page_params
      params.require(:page).permit(:image, :number, :level_id)
    end
end

