class Score < ActiveRecord::Base

  belongs_to :question

  def self.question_data topic_id
    Question.select('questions.id,questions.sl_no,questions.question,questions.option_a,questions.option_b,questions.option_c').where("topic_id=?", topic_id)
  end

  def self.student_data params
    Student.select('students.name,students.email').where("id=?",params[:student_id])
  end

  def self.insert_answer student_data
     student_data.each do |key,value|
      value.each do |question,option|
         answer = Score.new(:student_id=>key,:question_id=>question,:option=>option)
         answer.save!
      end
    end
  end

end

