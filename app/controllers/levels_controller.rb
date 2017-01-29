class LevelsController < ApplicationController
  
  load_and_authorize_resource
  before_action :get_levels
  
  respond_to :html

  def index
    respond_with(@levels)
  end

  def show
    gon.audio_stream_path = url_for(action: 'send_content', controller: 'contents', only_path: true)
    @level_book = Level.first.level_book
    @front_sections = Level.first.level_sections.by_front_number.to_a
    render @level.name
  end

  def new
    @level = Level.new
    respond_with(@level)
  end

  def edit
  end

  def create
    @level = Level.new(level_params)
    @level.save
    respond_with(@level)
  end

  def update
    @level.update(level_params)
    respond_with(@level)
  end

  def destroy
    @level.destroy
    respond_with(@level)
  end

  private
    def get_levels
      @available_levels = Level.available_levels(current_user.level.number)
    end
    
    def level_params
      params.require(:level).permit(:name)
    end
end
