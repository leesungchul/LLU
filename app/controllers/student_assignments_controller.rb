class StudentAssignmentsController < ApplicationController

  def create
    @student_assignment = StudentAssignment.new(params[:student_assignment])
    if @student_assignment.save
      render :json => Assignment.find(params[:student_assignment][:assignment_id])
    else
      render :json => @student_assignment.errors.full_messages, :status => 422
    end
  end

  def destroy
    @student_assignment = StudentAssignment.find_by_student_id_and_assignment_id(params[:student_assignment])
    @student_assignment.destroy
    render :json => {}
  end

  def update
    @student_assignment = StudentAssignment.find(params[:id])
    p params[:student_assignment]
    if @student_assignment.update_attributes(params[:student_assignment])
      render :json => {}
    else
      render :json => @student_assignment.errors.full_messages, :status => 422
    end
  end
end
