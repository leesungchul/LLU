class StudentKlass < ActiveRecord::Base
  attr_accessible :student_id, :klass_id
  belongs_to :student
  belongs_to :klass
end
