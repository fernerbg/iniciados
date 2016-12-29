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
      gon.file_path = "levels/#{params[:level]}/pages"
      gon.total_pages = Dir.entries("#{private_root}/#{gon.file_path}").size
    when 'lessons'
      gon.file_path = "lessons/#{params[:lesson]}/pages"
      gon.total_pages = Dir.entries("#{private_root}/#{gon.file_path}").size
    else
      gon.path = "error"
    end
    respond_to do |format|
      format.json do
        file_path = "#{private_root}/#{params[:file_path]}"
        entries = Dir.entries file_path
        files = []
        entries.each do |file_name|
          files[file_name.to_f - 1] = "data:image/jpg;base64," + Base64.encode64(File.read("#{file_path}/#{file_name}")).gsub("\n", '') unless file_name == '.' || file_name == '..'
          #files.push File.read "#{file_path}/#{file_name}" unless file_name == '.' || file_name == '..'
        end
        render json: files
      end
      format.html
    end
  end

  def create_page
    case params[:element]
    when 'levels'
      directory_name = "#{levels_root}/#{params[:file_path]}"
    when 'lessons'
      directory_name = "#{lessons_root}/#{params[:file_path]}"
    else
      directory_name = nil
    end
    FileUtils.mkdir_p directory_name
    params[:pieces].each_with_index do |piece, index|
      File.open("#{directory_name}/#{index + 1}.jpg", "w+b") do |file|
        file.write Base64.decode64(piece)
      end
    end
    respond_to do |format|
      format.json do
        render json: { success: true }
      end
    end
  end
  
  def new_page
    @element = params[:element]
    gon.element = params[:element]
    gon.upload_path = page_upload_path
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
    
    def levels_root
      "#{private_root}/levels"
    end
    
    def lessons_root
      "#{private_root}/lessons"
    end
end
