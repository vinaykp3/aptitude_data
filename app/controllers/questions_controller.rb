class QuestionsController < ApplicationController

  #http_basic_authenticate_with name:"relyon",password:"123"

  layout 'application'

  def new
    @user = Question.new
  end

  def index
    @user = Question.order('created_at')

  end

  def create
    @user = Question.new(user_params)
      if @user.save
        flash[:alert] = "Question has been successfully saved"
        redirect_to action: :index
        else
        render 'edit'
      end
  end

  def show

    @user = Question.find(params[:id])

  end

  def edit
    @user = Question.find(params[:id])
  end

  def destroy
    @user = Question.find(params[:id])
      @user.destroy
      redirect_to action: :index
  end

  def update
    @user = Question.find(params[:id])
      if @user.update(user_params)
        redirect_to @user
      else
        render 'edit'
      end
  end

  def student_answer
    @user1 = Question.fetch_answer
  end

  def student_indivisual_answer
      @student = Question.fetch_students_details

  end

  def javascript
  end

private
  def user_params
    params.require(:question).permit(:sl_no,:question,:option_a,:option_b,:option_c,:answer)
  end

end

