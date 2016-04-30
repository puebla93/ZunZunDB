class Article < ActiveRecord::Base
  validates :title, :presence => true
  validates :author, :presence => true
  validates :magazineId, :presence => true
  validates :totalpages, :allow_nil => true, :numericality => true
end
