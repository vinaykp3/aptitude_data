class ScoresController < ApplicationController

  def index
    @score1 = Score.question_data params[:topic_id]
    @student_id = params[:student_id]
    @topic_id = params[:topic_id]
  end

  def new
    @score = Score.new
  end

  def create

    @answer= Score.insert_answer params[:data]
    flash[:notice] = "You have successfully completed the test"
    redirect_to test_saved_scores_path :student_id => params[:student_id], :topic_id => params[:topic_id]
  end


  def test_saved
    @number_of_correct_answers = Score.number_of_correct_answers params[:student_id]
    @number_of_attempted_questions = Score.number_of_attempted_questions params[:student_id]
    @number_of_questions = Question.number_of_questions params[:topic_id]
    @student = Score.student_data params[:student_id]
  end

  private
  def score_params
    params.require(:score).permit(:student_id,:question_id,:option)
  end

end