class LessonLevelsController < ApplicationController
  #before_action :set_lesson_level, only: [:show, :edit, :update, :destroy]
  
  load_and_authorize_resource

  respond_to :html

  def index
    @lesson_levels = LessonLevel.all
    respond_with(@lesson_levels)
  end

  def show
    @available_lessons = @lesson_level.lessons.where("number <= #{current_user.lesson.number}").order(:number).to_a
    respond_with(@lesson_level)
  end

  def new
    @lesson_level = LessonLevel.new
    respond_with(@lesson_level)
  end

  def edit
  end

  def create
    @lesson_level = LessonLevel.new(lesson_level_params)
    @lesson_level.save
    respond_with(@lesson_level)
  end

  def update
    @lesson_level.update(lesson_level_params)
    respond_with(@lesson_level)
  end

  def destroy
    @lesson_level.destroy
    respond_with(@lesson_level)
  end

  private
    def set_lesson_level
      @lesson_level = LessonLevel.find(params[:id])
      redirect_to root_path unless current_user.lesson.lesson_level.id >= @lesson_level.id
    end

    def lesson_level_params
      params.require(:lesson_level).permit(:name)
    end
end
