class Chapter < ActiveRecord::Base
  belongs_to :section
  
  def to_s
    title
  end
end
