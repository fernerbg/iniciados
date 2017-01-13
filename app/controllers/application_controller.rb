class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user! 
  before_action :private_root
	
	helper_method :embedded_svg, :namespace, :private_root, :page_upload_path
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  def embedded_svg filename, options={}
    file = File.read(Rails.root.join('app', 'assets', 'images', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    svg['class'] = options[:class] if options[:class].present?
    svg['id'] = options[:id] if options[:id].present?
    svg.to_html.html_safe
  end
  
  def namespace
    names = self.class.to_s.split('::')
    return "null" if names.length < 2
    names[0..(names.length-2)].map(&:downcase).join('_')
  end
  
  def private_root
    "#{Rails.root}/private"
  end
  
  def page_upload_path
    url_for(action: 'create_page', controller: 'contents', only_path: true)
  end
end
