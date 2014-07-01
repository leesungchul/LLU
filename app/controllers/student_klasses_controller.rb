class StudentKlassesController < ApplicationController
  def create
    @student_klass = StudentKlass.new(params[:student_klass])
    if @student_klass.save
      render :json => Klass.find(params[:student_klass][:klass_id])
    else
      render :json => @student_klass.errors.full_messages, :status => 422
    end
  end

  def destroy
    @student_klass = StudentKlass.find_by_student_id_and_klass_id(params[:student_klass])
    @student_klass.destroy
    render :json => {}
  end
end
