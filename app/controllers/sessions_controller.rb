class SessionsController < ApplicationController

  def new
    @user = Student.new
  end

  def create
    user = Student.where(name: params[:signin][:name]).first
    if user && user.authenticate(params[:signin][:password])
      session[:user_id] = user.id
      redirect_to  student_result_questions_path(student_id: user.id)
      flash[:notice] = "Signed in successfully"
    else
      flash[:error] = "You should sign up before Signing In"
      render 'new'
    end
  end

end

