class QuestionsController < ApplicationController

  http_basic_authenticate_with name:"relyon",password:"123"

  layout 'application'

  def new
    @question = Question.new
  end

  def index
    @question = Question.order('created_at ASC')
  end

  def create
    @question= Question.new(user_params)
    if @question.save!
      flash[:alert] = "Question has been successfully saved"
      redirect_to action: :index
    else
      render nothing: true
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
     @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(user_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to action: :index
  end


  def student_answer
    @student_user = Question.fetch_answer
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

