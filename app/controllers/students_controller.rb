class StudentsController < ApplicationController

  def index
    @student = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
      if @student.save
        flash[:notice] = "Student details successfully saved"
          redirect_to @student
      else
        render 'new'
      end
  end

  def show
    @student = Student.find(params[:id])
  end

  def destroy
    @student=Student.find(params[:id])
      @student.destroy
        redirect_to action: :index
  end
  def fetch_student

  end

  private
    def student_params
      params.require(:student).permit(:name,:qualification,:age,:email,:password,:password_confirmation)
    end
end
