class Language < ActiveRecord::Base

  validates :name, uniqueness: true
  
end
