class Student < ActiveRecord::Base

  validates :name,:age, :qualification,presence: :true
  #validates :name, format: {with: /\A[a-zA-Z]+\z/,message: "Only Names are allowed"}

  def self.fetch_topic
    Topic.all
  end

end
