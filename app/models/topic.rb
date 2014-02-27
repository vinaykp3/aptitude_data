class Topic < ActiveRecord::Base

  validates :topic_name,presence: :true


  def self.topic_questions
    Topic.all
  end

end
