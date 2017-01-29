class Adm::ContentsController < Adm::BaseController

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
