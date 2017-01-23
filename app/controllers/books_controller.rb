class BooksController < InheritedResources::Base

  private

    def book_params
      params.require(:book).permit(:title, :level_id, :description)
    end
end

