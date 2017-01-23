class Adm::ContentsController < Adm::BaseController

  respond_to :html
  
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
    gon.upload_path = url_for(action: 'create_page', only_path: true)
  end
  
  def users_csv
  end
  
  def upload_users_csv
    require 'csv'
    @rows = []
    CSV.foreach(params[:file].path) do |row|
      
      lesson_level_name = row[3].split(" ").first
      number_level = row[3].split(" ").last
      
      lesson_level = LessonLevel.where(name: lesson_level_name).first
      lesson = lesson_level.lessons.where(number_level: number_level).first
      level = Level.where(name: row[4] + " I").first
      headquarter = Headquarter.where(name: row[5]).first
      
      user = User.new( {name: row[0], surname: row[1], email: row[2], lesson: lesson, level: level, headquarter: headquarter, password:'sbabaji7'} )
      user.save!
      
    end
    
  end
  
  private
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
