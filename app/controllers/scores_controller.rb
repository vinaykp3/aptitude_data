class ScoresController < ApplicationController

  load_and_authorize_resource

  def index
    @score1 = Score.question_data params[:topic_id]
    @topic_id = params[:topic_id]
    @user_id = current_user.id

  end

  def new
    @score = Score.new
  end

  def create
    student_id,question_id,option= Score.insert_answer params[:data],params[:time_taken]
    flash[:success] = "You have successfully completed the test"
    redirect_to display_scores_path :user_id => params[:user_id],:topic_id => params[:topic_id]
  end

  def test_saved
    #binding.pry
    #@topic_id = params[:topic_id]
    @user_id = current_user.username
    @number_of_correct_answers = Score.number_of_correct_answers params[:user_id]
    @number_of_attempted_questions = Score.number_of_attempted_questions params[:user_id]
    @number_of_questions = Question.number_of_questions params[:topic_id]
    @student = Score.student_data params[:user_id]
    @candidate_details = User.candidate_details params[:user_id]
    @topic_name = Topic.all
    @time = Score.calculate_final_time params[:user_id]
  end

  def display
    
  end

  private
  def score_params
    params.require(:score).permit(:user_id,:question_id,:option,:time_taken)
  end

end