class Question < ActiveRecord::Base

  has_many :scores

  validates :question,:option_a,:option_b,:option_c,:answer, presence: true

  #validates :sl_no, numericality: {only_integer: :true,
  #                                 message: 'only number must be entered'}

  scope :index,lambda {order("created_at DESC")}

  def self.students_details
    User.select("id,username,email,created_at")
    #User.select("users.id,username,email,users.created_at,question_id").joins("INNER JOIN scores ON scores.student_id = users.id")
  end

  def self.fetch_id
    User.select("id")
  end

  def self.fetch_student_details params
    Question.select("questions.question,questions.answer,scores.option,topics.topic_name,topics.description, topics.id as topic_id").joins("INNER JOIN scores ON questions.id=scores.question_id INNER JOIN topics ON topics.id=questions.topic_id ").where("scores.user_id=? ",params[:student_id])
  end

  def self.student_excel params
    require 'axlsx'
    package = Axlsx::Package.new
    wb = package.workbook
    question_details = Question.select("questions.question,questions.answer,scores.option,topics.topic_name,topics.description, topics.id as topic_id").joins("INNER JOIN scores ON questions.id=scores.question_id INNER JOIN topics ON topics.id=questions.topic_id ").where("scores.student_id=? ",params[:student_id])
    wb.styles do |s|
      normal_cell =  s.add_style(:bg_color => "CEE0DF",:b => true,:fg_color => "00", :sz => 10, :border => Axlsx::STYLE_THIN_BORDER,:alignment => { :horizontal=> :center })
      bold_cell = s.add_style(:b => true, :sz => 10,:border => Axlsx::STYLE_THIN_BORDER)
      bold_data_cell = s.add_style(:b => true, :sz => 10)
      data_cell = s.add_style(:border => Axlsx::STYLE_THIN_BORDER)

      wb.add_worksheet(name:"Student_Answer_Details") do |sheet|
        sheet.add_row ["Topic Name ","Question","Answer","Option"]
        question_details.each do |student|
          sheet.add_row [student.topic_name, student.question, student.answer, student.option]
        end
      end
    end

    student_det= "#{Rails.root}/public/Student.xlsx"
    file = File.new(student_det, "w")
    package.serialize(file)
    return file

  end

  def self.student_view params
    Question.select("questions.question,questions.answer,scores.option,students.name, students.name").joins("INNER JOIN scores ON questions.id=scores.question_id INNER JOIN students ON scores.student_id=students.id").where("scores.student_id=?",params)
  end

  def self.count
    Question.select(" ")
  end

  def self.number_of_questions topics
     Question.where("topic_id=?", topics).count()
  end

  def self.fetch_topic
    Topic.all
  end

  def self.dashboard_admin
    User.select("id,username,email,created_at")
  end

  def self.number_of_questions_in_topic topics
    questions = {}
    topics.each do |topic_details|
      ids = topic_details.id
      questions["#{ids}"] = Question.where("topic_id=?", topic_details.id).count()
    end
    questions
  end

  #def self.number_of_question_in_particular_topic topics
  #  questions = {}
  #  topics.each do |topic|
  #    id = topic.id
  #    questions["#{id}"] = Question.where("topic_id=?", topic.id).count()
  #  end
  #  questions
  #
  #end

  def self.number_of_correct_answers student_id
    #Score.select(" question.topic_id,question.asnwer").joins(" IINER JOIN questions ON questions.answer=scores.option")..where("student_id=?",student_id).count
    Score.joins("INNER JOIN questions ON questions.answer=scores.option").where("student_id=?",student_id).count
  end
end