class Assignment < ActiveRecord::Base
  attr_accessible :name, :klass_id
  has_many :student_assignments
  belongs_to :klass
end
