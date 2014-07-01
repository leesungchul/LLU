class StudentAssignment < ActiveRecord::Base
  attr_accessible :student_id, :assignment_id, :status
  belongs_to :student
  belongs_to :assignment
end
