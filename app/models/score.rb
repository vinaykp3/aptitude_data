class Score < ActiveRecord::Base

  belongs_to :question
  belongs_to :user

  def self.number_of_correct_answers student_id
    Score.joins("INNER JOIN questions ON questions.answer=scores.option").where(" student_id=?",student_id).count
  end

  def self.number_of_attempted_questions student_id
    Score.select("DISTINCT question_id").where("student_id = ?",student_id).count
  end

  def self.question_data topic_id
    Question.select('sl_no,question,option_a,option_b,option_c,topics.topic_name,topics.id').joins("Inner join topics ON questions.topic_id=topics.id").where("topic_id = ?", topic_id)
  end

  def self.student_data user_id
     User.select('users.id,users.email').where("id=?",user_id)
  end

  def self. insert_answer student_data
     student_data.each do |key,value|
      value.each do |question,option|
         answer = Score.new(:student_id=>key,:question_id=>question,:option=>option)
         answer.save!
      end
    end
  end

  def self.fetch_users
    User.all
  end

end

