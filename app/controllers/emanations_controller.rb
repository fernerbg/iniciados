class EmanationsController < InheritedResources::Base

  private

    def emanation_params
      params.require(:emanation).permit(:image_url, :message, :title, :level_id)
    end
end

