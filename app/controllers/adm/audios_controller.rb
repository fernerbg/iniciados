class Adm::AudiosController < Adm::BaseController
    
  def create
    @audio = Audio.new(audio_params)
    @audio.save
    case params[:element]
    when 'levels'
      LevelAudio.create({audio_id: @audio.id, level_id: params[:level_id], number: params[:number]})
    else
      'error'
    end
    redirect_to action: :new, element: 'levels'
  end
  
  def new
    @audio = Audio.new
    @element = params[:element]
    gon.element = params[:element]
    gon.upload_path = url_for(action: 'create', only_path: true)
  end
  
  private
    def audio_params
      params.require(:audio).permit(:name, :length, :wave, :track, :description)
    end
end

