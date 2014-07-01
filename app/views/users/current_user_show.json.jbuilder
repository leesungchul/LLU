json.(@current_user, :user_name, :email, :id)
json.klasses @current_user.klasses do |klass|
  json.id klass.id
  json.name klass.name
  json.assignments klass.assignments do |json, assignment|
    json.id assignment.id
    json.name assignment.name
    json.klass_id assignment.klass_id
  end
end
json.student_assignments @current_user.student_assignments do |student_assignment|
  json.id student_assignment.id
  json.student_id student_assignment.student_id
  json.assignment_id student_assignment.assignment_id
  json.status student_assignment.status
end

