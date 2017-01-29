class BooksController < InheritedResources::Base
  def show_page
    gon.initial_page = params[:number]
    book = Book.find(params[:id])
    authorize! :read, book.authority
    session[:book_id] = book.id
    gon.total_pages = Dir.entries("#{books_root}/#{book.id}").size
    gon.send_page_url = url_for(action: 'send_page', only_path: true)
  end
  
  def send_page
    if params[:id].to_i == session[:book_id].to_i
      send_file "#{books_root}/#{params[:id]}/#{params[:page]}/#{params[:portion]}"
    else
      render nothing: true, status: 406
    end
  end
  
  private
  def books_root
  	"#{private_root}/books"
  end
end

