class UsersController < ApplicationController
  def current_user_show
    @current_user = current_user
    @klasses = current_user.klasses
    @assignments = current_user.assignments
    @student_klasses = current_user.student_klasses
    @student_assignments = current_user.student_assignments
  end
end
