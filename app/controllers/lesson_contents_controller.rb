class LessonContentsController < ApplicationController
  before_action :set_lesson_content, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @lesson_contents = LessonContent.all
    respond_with(@lesson_contents)
  end

  def show
    respond_with(@lesson_content)
  end

  def new
    @lesson_content = LessonContent.new
    respond_with(@lesson_content)
  end

  def edit
  end

  def create
    @lesson_content = LessonContent.new(lesson_content_params)
    @lesson_content.save
    respond_with(@lesson_content)
  end

  def update
    @lesson_content.update(lesson_content_params)
    respond_with(@lesson_content)
  end

  def destroy
    @lesson_content.destroy
    respond_with(@lesson_content)
  end

  private
    def set_lesson_content
      @lesson_content = LessonContent.find(params[:id])
    end

    def lesson_content_params
      params.require(:lesson_content).permit(:lesson_id, :content_id)
    end
end
