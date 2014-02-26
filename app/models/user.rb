class User < ActiveRecord::Base
  #attr_accessible :title, :body
  has_many :microposts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me


  has_many :evaluations, class_name: "RSEvaluation", as: :source
  has_reputation :votes, source: {reputation: :votes, of: :microposts}, aggregated_by: :sum

  def voted_for?(haiku)
    evaluations.where(target_type: Micropost.class, target_id: micropost.id).present?
  end

  def feed
    # Это предварительное решение. См. полную реализацию в "Following users".
    Micropost.where("user_id = ?", id)
  end  
end 