class Topic < ActiveRecord::Base

  validates :topic_name,presence: :true


  def self.topic_questions
    Topic.all
  end

  def self.search(search)
    if search
      find(:all,:conditions=>['topic_name LIKE ?',"%#{search}%"])
    else
      find(:all)
    end
  end

  def self.fecth_topic params
    Topic.select("topic_name,description,questions.question,questions.option_a,questions.option_b,questions.option_c,questions.answer ,topics.id ").joins(" INNER JOIN questions ON questions.topic_id=topics.id").where("questions.topic_id=? ",params)
  end

  def self.number_of_questions topic_id
  Topic.select("id").joins("INNER JOIN questions ON questions.topic_id=topics.id").where("id=?", topic_id).count()

  end

end
