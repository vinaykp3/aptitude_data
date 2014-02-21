class Score < ActiveRecord::Base

  belongs_to :question

  def self.question_data
    Question.all
  end

  def self.student_data
    Student.select('students.name,students.email')

  end

  def self.insert_answer student_data
    student_data.each do |key,value|
      value.each do |question,option|
         answer = Score.new(:student_id=>key,:question_id=>question,:option=>option)
        answer.save
      end
    end
  end

end

#def self.data_fetch
#  Question.select("questions.id, questions.question, options.option_a, options.option_b, options.option_c").joins("INNER JOIN options ON questions.id = options.question_id")#
#end
