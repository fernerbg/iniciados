class PagesController < InheritedResources::Base

  private

    def page_params
      params.require(:page).permit(:page_url, :number, :level_id)
    end
end

