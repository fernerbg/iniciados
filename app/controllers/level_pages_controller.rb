class LevelPagesController < InheritedResources::Base
  
  def new
    gon.createUrl = url_for(controller:"level_pages", action:"create", only_path: true)
  end
  
  def create
    @page = LevelPage.find_or_create_by(level_page_params)
    @page.save
    if not @page.id.nil?
      level_dir = "#{Rails.root}/private/level"
      Dir.mkdir(level_dir) unless File.exists?(level_dir)
      
      dir = "#{level_dir}/#{@page.level}"
      Dir.mkdir(dir) unless File.exists?(dir)
      
      page_dir = "#{dir}/page_#{@page.number}" 
      Dir.mkdir(page_dir) unless File.exists?(page_dir)
      
      params[:pieces].each_with_index do |piece, index|
        File.open("#{page_dir}/piece_#{index}.jpg", 'w+b') do |f|
          f.write(Base64.decode64(piece))
        end
      end
    end
    respond_to do |format|
      format.html do
        respond_with @page
      end
      format.json do
        render json: [@page.id, @page.number]
      end
    end
  end
  
  def show
    respond_to do |format|
      format.html do
        gon.path = "levels/" + params[:level] + "/book/"
        gon.initial_page = params[:number]
      end
    end
  end
  
  private
    def level_page_params
      params.require(:level_page).permit(:number, :level_id)
    end
    
    def get_page_pieces
      dir = "#{Rails.root}/private/level/#{@page.level}/page_#{@page.number}"
      file_names = Dir.entries(dir)
      file_pieces = []
      file_names.each do |piece_name|
        if piece_name.start_with?("piece")
          result = { :name => piece_name, :data => "data:image/jpg;base64," + Base64.encode64(File.read("#{dir}/#{piece_name}")).gsub("\n", '') }
          file_pieces.push result
        end
      end
    end
end

