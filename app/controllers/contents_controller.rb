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

  def show_book
    @content = Content.where('title = :title AND page_number = :page_number', {title: params[:title], page_number: params[:page_number]}).first
    base_64 = Base64.encode64(File.read(@content.document.current_path)).gsub("\n", '')
    @data = "data:image/jpg;base64,#{base_64}"
    @page_number = params[:page_number].to_i
    if params[:total_pages] == "0"
      @total_pages = Content.where('title = :title', {title: params[:title]}).select("page_number").order(page_number: :desc).first.page_number
    else
        @total_pages = params[:total_pages]
    end
    respond_to do |format|
      format.html
      format.json do
        data = @data
        render json: {image: data}
      end
    end
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

  def delivery
    @content = Content.find(params[:id])
    respond_to do |format|
      format.html do
        send_file @content.document.current_path, :x_sendfile=>true, :disposition => 'inline'
      end
      format.json do
        data = Base64.encode64(File.read(@content.document.current_path)).gsub("\n", '')
        render json: {image: "data:image/png;base64,#{data}"}
      end
    end
  end

  def delivery_pages
    @contents = Content.where(title: params[:title]).order(:page_number).offset(params[:offset]).limit(params[:chunk_size])
    respond_to do |format|
      format.html do
        send_file @contents.first.document.current_path, :x_sendfile=>true, :disposition => 'inline'
      end
      format.json do
        data = []
        @contents.each do |content|
          if not content.document.nil?
            base_64 = Base64.encode64(File.read(content.document.current_path)).gsub("\n", '')
            data << "data:image/png;base64,#{base_64}"
          end
          #data << content.page_number
        end
        render json: {images: data}
      end
    end
  end

  private
    def set_content
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:title, :description, :type, :thumbnail, :url, :file, :page_number)
    end
end
