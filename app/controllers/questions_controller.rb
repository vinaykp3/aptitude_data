class QuestionsController < ApplicationController

  load_and_authorize_resource

  def new
    @question = Question.new
  end

  def index
     @question = Question.index
  end

  def create
    @question= Question.new(question_params)
    if @question.save
      flash[:success] = "Question has been successfully saved"
      redirect_to action: :index
    else
      render 'new'
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
    if @question.update(question_params)
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
    @student_answer = Question.students_details
    @student_search = User.search(params[:search])
    @topic = Topic.all

    params[:student_id] = @student_answer
    params[:topic_id] = @topic
    #
    #@number_of_correct_answers = Score.number_of_correct_answers params[:student_id]
    #@number_of_questions = Question.number_of_questions params[:topic_id]

    @number_of_questions = Question.number_of_questions_in_topic params[:topic_id]

    @number_of_correct_answers = Score.number_of_correct_answers_for_student params[:student_id]

  end

  def student_individual_answer
    @student_id = params[:student_id]
    @student_individual_answer = Question.fetch_student_details params
    @topic_id = @student_individual_answer.first.topic_id
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

 def select_topic
   @user_id = current_user.id
   @topic_id = Question.fetch_topic
 end

  def dashboard_admin
    @admin = Question.dashboard_admin
  end

  private
  def question_params
    params.require(:question).permit(:sl_no,:question,:option_a,:option_b,:option_c,:answer,:topic_id)
  end

end

