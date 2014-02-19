class Student < ActiveRecord::Base

  belongs_to :Question
  has_secure_password

  validates :name,:age,presence: :true
  #validates :name, format: {with: /\A[a-zA-Z]+\z/,message: "Only letter are allowed"}

end
