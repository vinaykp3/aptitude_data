class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_and_belongs_to_many :roles

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def roles?(role)
    return !!self.roles.find_by_role_name(role)
  end

  def self.search(search)
    if search
      find(:all,:conditions=>['username ILIKE ?',"%#{search}%"])
    else
      find(:all)
    end
  end

  def self.score_search(search)
    if search
      joins("INNER JOIN scores ON scores.user_id = users.id INNER JOIN questions ON questions.id=scores.question_id").where("username ILIKE ?",search)
    else
      joins("INNER JOIN scores ON scores.user_id = users.id INNER JOIN questions ON questions.id=scores.question_id")
    end
  end


  def self.candidate_details user_id
    User.select("username,email,created_at").where("id=?",user_id)
  end

end
