class Book < ActiveRecord::Base
  validates :title, :presence => true
  validates :year, :allow_nil => true, :numericality => true
  validates :author, :presence => true
  validates :totalpages, :allow_nil => true, :numericality => true
  validates :editionyear, :allow_nil => true, :numericality => true
end
