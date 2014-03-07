class Score < ActiveRecord::Base

  belongs_to :question

  def self.number_of_correct_answers student_id
    Score.joins("INNER JOIN questions ON questions.answer=scores.option").where(" student_id=?",student_id).count
  end

  def self.number_of_attempted_questions student_id
    Score.select("DISTINCT question_id").where("student_id = ?",student_id).count
  end

  def self.question_data topic_id
    Question.select('id,sl_no,question,option_a,option_b,option_c').where("topic_id=?", topic_id)
  end

  def self.student_data student_id
     Student.select('students.id,students.name,students.email').where("id=?",student_id)
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

