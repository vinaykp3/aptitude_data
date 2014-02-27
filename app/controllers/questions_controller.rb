class QuestionsController < ApplicationController

  http_basic_authenticate_with name:"relyon",password:"123"

  layout 'application'

  def new
    @user = Question.new
  end

  def index
    @user = Question.order('created_at ASC')
  end

  def create
    @user= Question.new(user_params)
    if @user.save!
      flash[:alert] = "Question has been successfully saved"
      redirect_to action: :index
    else
      render nothing: true
    end
  end

  def show
    @user = Question.find(params[:id])
  end

  def edit
     @user = Question.find(params[:id])
  end

  def update
    @user = Question.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = Question.find(params[:id])
    @user.destroy
    redirect_to action: :index
  end


  def student_answer
    @user1 = Question.fetch_answer
  end

  def student_individual_answer
    @student = Question.fetch_student_details params
  end

  def excel_generate
    file = Question.student_excel params
    respond_to do |format|
      format.html
      format.xlsx{
        send_file  file.path,
                   :filename => File.basename(file),
                   :type => File.ftype(file),
                   :disposition => 'attachment'
      }
    end
  end

  def student_result
    @student1 = Question.student_view params[:student_id]
  end

  def javascript

  end

  private
  def user_params
    params.require(:question).permit(:sl_no,:question,:option_a,:option_b,:option_c,:answer,:topic_id)
  end

end

