class AudiosController < InheritedResources::Base
  
  before_action :set_audio, only: [:send_wave, :stream]
    
  def create
    @audio = Audio.new(audio_params)
    @audio.save
    case params[:element]
    when 'levels'
      LevelAudio.create({audio_id: @audio.id, level_id: params[:level_id], number: params[:number]})
    else
      'error'
    end
    respond_with(@audio)
  end
  
  def new
    @audio = Audio.new
    @element = params[:element]
    gon.element = params[:element]
    gon.upload_path = url_for(action: 'create', only_path: true)
  end
  
  def send_wave
    send_file @audio.wave.current_path
  end
  
  def stream
    send_file @audio.track.current_path
  end
  
  private
    def set_audio
      @audio = Audio.find(params[:id])
    end
    
    def audio_params
      params.require(:audio).permit(:name, :length, :wave, :track, :description)
    end
end

