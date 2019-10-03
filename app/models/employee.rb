class Employee < ActiveRecord::Base
  validates :name, :presence => true
  validates :gender, :presence => true
end
