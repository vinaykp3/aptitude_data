class Score < ActiveRecord::Base

  belongs_to :question
  belongs_to :user

  validates :user_id,:question_id,:option,presence: true

  def self.number_of_correct_answers student_id
    Score.joins("INNER JOIN questions ON questions.answer=scores.option").where("user_id=?",student_id).count
    #Score.joins("INNER JOIN questions ON questions.id=scores.question_id").where("user_id=?",student_id).count
  end

  def self.number_of_attempted_questions user_id
    Score.select("DISTINCT question_id").where("user_id = ?",user_id).count
  end

  def self.question_data topic_id
    Question.select('questions.id ,sl_no,question,option_a,option_b,option_c,topics.topic_name,topics.id as topic_id').joins("INNER JOIN topics ON questions.topic_id=topics.id").where("topic_id = ?", topic_id)
  end

  def self.student_data user_id
     User.select('users.id,users.email').where("id=?",user_id)
  end

  def self.insert_answer student_data,time
     student_data.each do |key,value|
      value.each do |question,option|
        @student_id = key
        @question_id = question
        @option = option
        answer = Score.new(:user_id=>@student_id,:question_id=>@question_id,:option=>@option,:time_taken=>time)
        answer.save!
      end
     end


  end

  def self.calculate_final_time time
    Score.select("user_id,question_id,option,time_taken").where("user_id=?",time)
  end

  def self.fetch_users
    User.all
  end

  def self.number_of_correct_answers_for_student student_id
    correct = {}
    student_id.each do |student|
      ids = student.id
      correct["#{ids}"] = Score.joins("INNER JOIN questions ON questions.answer=scores.option").where("user_id=?",student.id).count()
    end
    correct
  end

  def self.select_topic topic
    Topic.select("topics.id,topics.topic_name").where("id=?",topic)

  end

end

