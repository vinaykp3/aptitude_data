class Question < ActiveRecord::Base

  has_many :students
  has_many :score

  validates :sl_no,:question,presence: :true
  validates :sl_no, numericality: {only_integer: :true,
            message: 'only number must be entered'}


  def self.fetch_answer
    Score.select("scores.student_id,scores.question_id,scores.option,students.name").joins("FULL JOIN students ON scores.student_id=students.id")

  end

end

