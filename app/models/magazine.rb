class Magazine < ActiveRecord::Base
  validates :number, :presence => true, :numericality => true, :uniqueness => true
  validates :year, :allow_nil => true, :numericality => true
  validates :cd, :allow_nil => true, :numericality => true
end
