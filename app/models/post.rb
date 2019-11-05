class Post < ApplicationRecord
belongs_to :user
has_many :comments
has_many :likes, dependent: :destroy
has_many :iine_users, through: :likes, source: :user

  def iine?(user)
    iine_users.include?(user)
    ##イイねuserにuserオブジェクトが含まれていたら
    
  end

  def iine(user)
    likes.create(user_id: user.id)
  end

  def uniine(user)
    likes.find_by(user_id: user.id).destroy
  end

end

