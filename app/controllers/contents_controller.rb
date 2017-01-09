class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  respond_to :html

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
          #files[file_name.to_f - 1] = "data:image/jpg;base64," + Base64.encode64(File.read("#{file_path}/#{file_name}")).gsub("\n", '') unless file_name == '.' || file_name == '..'
          files[file_name.to_f - 1] = File.read("#{file_path}/#{file_name}") unless file_name == '.' || file_name == '..'
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
    (1..10).each do |i|
      File.open("#{directory_name}/#{i}.jpg", "w+b") do |file|
        puts "The data is"
        puts "data" + i.to_s
        file.write(params["data" + i.to_s].read)
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
  
  def send_content
    case params[:element]
    when 'audio_wave' 
      audio = Audio.find(params[:id])
      send_file audio.wave.current_path
    when 'audio_track'
      audio = Audio.find(params[:id])
      send_file audio.track.current_path
    when 'notification_media'
      notification = Notification.find(params[:id])
      send_file notification.media.current_path
    when 'book_page'
      send_file "#{private_root}/#{params[:file_path]}"
    else
      'none'
    end
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
