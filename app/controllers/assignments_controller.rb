class AssignmentsController < ApplicationController
  before_filter :check_registered, :only => [:index, :update, :show]
  before_filter :check_teacher, :only => [:index, :create, :destroy, :show]
  before_filter :check_open, :only => [:update]
  def create
    @assignment = Assignment.new(params[:assignment])
    @klass = Klass.find(params[:assignment][:klass_id])
    @klass.students.each do |student|
      @assignment.student_assignments.new({:student_id => student.id})
    end
    if @assignment.save
      render :json => @assignment
    else
      render :json => @assignment.errors.full_messages, :status => 422
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy
    render :json => {}
  end

  def index
    @assignments = []
    current_user.klasses.each do |klass|
      @assignments += klass.assignments
    end
    render :json => @assignments
  end

  def show
    @assignment = Assignment.find(params[:id])
    render :json => @assignment
  end

  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update_attributes(params[:assignment])
      render :json => @assignment
    else
      render :json => @assignment.errors.full_messages, :status => 422
    end
  end

  private
  def check_registered
    @klass = Klass.find(params[:klass])
    current_user.klasses.include?(@klass)
  end

  def check_teacher
    @klass = Klass.find(params[:klass])
    current_user.class.name == "Teacher" && @klass.teacher == current_user.user_name
  end

  def check_open
    @assignment = Assignment.find(params[:id])
    @studentassignment = StudentAssignment.find_by_student_id_and_assignment_id(current_user.id, @assignment.id)
    @studentassignment.status == "Open"
  end
end
