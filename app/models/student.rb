class Student < User
  has_many :student_klasses
  has_many :klasses, :through => :student_klasses, :source => :klass
  has_many :student_assignments
  has_many :assignments, :through => :student_assignments, :source => :assignment
end
