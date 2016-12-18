class LevelPage < ActiveRecord::Base
  
  belongs_to :level
  
  validates :level, presence: true
  validates :number, presence: true, :numericality => { :greater_than => 0 }
  
  def prev_page
    LevelPage.where(level: level, number: number - 1).first
  end
  
  def next_page
    LevelPage.where(level: level, number: number + 1).first
  end
  
  def to_page(page_num)
    LevelPage.where(level: level, number: page_num).first
  end
end
