class StudentsController < ApplicationController
  before_filter :require_current_user!, :only => [:index, :show]
  before_filter :require_no_current_user!, :only => [:create, :new]

  def create
    @student = Student.new(params[:student])
    if @student.save
      self.current_user = @student
      redirect_to "/"
    else
      flash.now[:errors] = @student.errors.full_messages
      redirect_to "/"
    end
  end

  def new
    @student = Student.new
  end

  def index
    @students = Kaminari.paginate_array(Students.where('id != ?', current_user.id))
      .page(params[:page]).per(12)
    render :json => {
      :models => @students,
      :page => params[:page],
      :total_pages => @students.total_pages
    }
  end

  def show
    @student = Student.find(params[:id])
    render :json => @student
  end
end
