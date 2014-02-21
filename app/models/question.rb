class Question < ActiveRecord::Base

  has_many :students
  has_many :score

  validates :sl_no,:question,:option_a,:option_b,:option_c,presence: :true

  validates :sl_no, numericality: {only_integer: :true,
            message: 'only number must be entered'}


  def self.fetch_answer
    Student.select("students.name")
  end

  def self.fetch_students_details
     Score.where("option = ? OR option = ? OR option = ?", 'c', 'a', 'b')
  end

end



