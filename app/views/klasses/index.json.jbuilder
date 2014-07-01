json.klasses @klasses do |klass|
  json.id klass.id
  json.name klass.name
  json.assignments klass.assignments do |json, assignment|
    json.id assignment.id
    json.name assignment.name
    json.klass_id assignment.klass_id
  end
end