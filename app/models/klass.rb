class Klass < ActiveRecord::Base
  attr_accessible :name
  has_many :student_klasses
  has_many :students, :through => :student_klasses, :source => :student
  has_many :assignments
end
