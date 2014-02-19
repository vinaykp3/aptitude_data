class ScoresController < ApplicationController

  def index
    @score1 = Score.question_data
    @student_id = params[:student_id]
  end

  def new
    @score = Score.new
  end

  def create
    @answer= Score.insert_answer params[:data]
    flash[:notice] = "You have successfully completed the test"
      redirect_to  action: :test_saved
  end


  def test_saved
    @student = Score.student_data
  end

  private
  def score_params
    params.require(:score).permit(:student_id,:question_id,:option)
  end

end