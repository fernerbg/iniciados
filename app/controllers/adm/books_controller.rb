class Adm::BooksController < Adm::BaseController
  respond_to :html
  
  def create
  	@book = Book.new(book_params)
    case params[:element]
    when 'levels'
      authority = Level.find(params[:id])
    when 'lessons'
      authority = Lesson.find(params[:id])
    else
      authority = nil
    end
    @book.authority = authority
    @book.save
    FileUtils.mkdir_p "#{books_root}/#{@book.id}"
	  redirect_to adm_books_path
  end
  
  def update
    case params[:element]
    when 'levels'
      authority = Level.find(params[:id])
    when 'lessons'
      authority = Lesson.find(params[:id])
    else
      authority = nil
    end
    update! do |format|
    	format.html do
	    	@book.authority = authority
	    	@book.save
	    	redirect_to adm_books_path
	    end
    end
  end
  
  def destroy
  	FileUtils.rm_rf("#{books_root}/#{params[:id]}")
  	destroy!
  end
  
  def create_page
    book = Book.find(params[:id])
    directory_name = "#{books_root}/#{book.id}/#{params[:page_number]}"
    FileUtils.mkdir directory_name
    (1..10).each do |i|
      File.open("#{directory_name}/#{i}.jpg", "w+b") do |file|
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
  	book = Book.find(params[:id])
    gon.upload_path = url_for(action: 'create_page', book: book, only_path: true)
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :description)
  end
  
  def books_root
  	"#{private_root}/books"
  end
end