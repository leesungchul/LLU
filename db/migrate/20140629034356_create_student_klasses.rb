class CreateStudentKlasses < ActiveRecord::Migration
  def change
    create_table :student_klasses do |t|
      t.integer :student_id
      t.integer :klass_id
      t.timestamps
    end
  end
end
