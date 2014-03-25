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
    @answer= Score.insert_answer params[:data]
    flash[:success] = "You have successfully completed the test"
    redirect_to test_saved_scores_path :user_id => params[:user_id],:topic_id => params[:topic_id]
  end


  def test_saved
    @user_id = current_user.username.capitalize
    @number_of_correct_answers = Score.number_of_correct_answers params[:user_id]
    @number_of_attempted_questions = Score.number_of_attempted_questions params[:user_id]
    @number_of_questions = Question.number_of_questions params[:topic_id]
    @student = Score.student_data params[:user_id]
  end


  private
  def score_params
    params.require(:score).permit(:student_id,:question_id,:option)
  end

end