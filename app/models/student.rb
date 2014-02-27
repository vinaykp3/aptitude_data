class Student < ActiveRecord::Base

  belongs_to :Question
  has_secure_password

  validates :name,:age,:qualification,presence: :true
  #validates :name, format: {with: /\A[a-zA-Z]+\z/,message: "Only Names are allowed"}

  def self.fetch_topic
    Topic.all
  end
end
