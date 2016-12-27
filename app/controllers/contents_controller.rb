class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  respond_to :html
  
  def index
    @contents = Content.all
    respond_with(@contents)
  end

  def show
    respond_with(@content)
  end
  
  def show_page
    gon.initial_page = params[:number]
    case params[:element]
    when 'levels'
      gon.path = "levels/#{params[:level]}/book/"
    when 'lesson_levels'
      gon.path = "lessons/#{params[:lesson]}/reading/"
    else
      gon.path = "error"
    end
  end

  def new
    @content = Content.new
    respond_with(@content)
  end

  def edit
  end

  def create
    @content = Content.new(content_params)
    @content.save
    respond_with(@content)
  end

  def update
    @content.update(content_params)
    respond_with(@content)
  end

  def destroy
    @content.destroy
    respond_with(@content)
  end

  private
    def set_content
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:title, :description, :file, :page_number)
    end
    
    def book_params
      params.require(:book).permit(:title, :page_number, :document)
    end
end
