class LevelContentsController < ApplicationController
  before_action :set_level_content, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @level_contents = LevelContent.all
    respond_with(@level_contents)
  end

  def show
    respond_with(@level_content)
  end

  def new
    @level_content = LevelContent.new
    respond_with(@level_content)
  end

  def edit
  end

  def create
    @level_content = LevelContent.new(level_content_params)
    @level_content.save
    respond_with(@level_content)
  end

  def update
    @level_content.update(level_content_params)
    respond_with(@level_content)
  end

  def destroy
    @level_content.destroy
    respond_with(@level_content)
  end

  private
    def set_level_content
      @level_content = LevelContent.find(params[:id])
    end

    def level_content_params
      params.require(:level_content).permit(:level_id, :content_id)
    end
end
