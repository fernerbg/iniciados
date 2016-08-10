class ContentsController < ApplicationController
  
  inherit_resources
  
  respond_to :html
  
  def new
    @content = Content.new
    @file = @content.document
    @file.success_action_status = "201"
  end

  def show_book
    @content = Content.where('title = :title AND page_number = :page_number', {title: params[:title], page_number: 1}).first
    @total_pages = Content.where('title = :title', {title: params[:title]}).select("page_number").order(page_number: :desc).first.page_number
  end

  def delivery
    @content = Content.find(params[:id])
    respond_to do |format|
      format.html do
        send_file @content.file.current_path, :x_sendfile=>true, :disposition => 'inline'
      end
      format.json do
        data = Base64.encode64(File.read(@content.file.current_path)).gsub("\n", '')
        render json: {image: "data:image/png;base64,#{data}"}
      end
    end
  end

  def delivery_pages
    @contents = Content.where(title: params[:title]).order(:page_number).offset(params[:offset]).limit(params[:chunk_size])
    respond_to do |format|
      format.html do
        send_file @contents.first.file.current_path, :x_sendfile=>true, :disposition => 'inline'
      end
      format.json do
        data = []
        @contents.each do |content|
          base_64 = Base64.encode64(File.read(content.file.current_path)).gsub("\n", '')
          data << "data:image/png;base64,#{base_64}"
          #data << content.page_number
        end
        render json: {images: data}
      end
    end
  end

  def binary_data
    
  end
  
  private
    def content_params
      params.require(:content).permit(:title, :description, :type, :thumbnail, :url, :file, :page_number)
    end
end
