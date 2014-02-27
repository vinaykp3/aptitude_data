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
    redirect_to test_saved_scores_path params[:student_id]
  end


  def test_saved
    @student = Score.student_data params
  end

  private
  def score_params
    params.require(:score).permit(:student_id,:question_id,:option)
  end

end