class Adm::PagesController < Adm::BaseController
    
    def new
        @book = Book.find(params[:book_id])
        @page = Page.new
        new! do |format|
            format.html  {
                @uploader = @page.image
                @uploader.success_action_redirect = new_adm_book_page_path(@book)
            }
        end
    end
    
    private

    def page_params
        params.require(:page).permit(:number, :image)
    end
    
end