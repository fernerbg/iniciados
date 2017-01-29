class Book < ActiveRecord::Base
  belongs_to :authority, polymorphic: true
end
