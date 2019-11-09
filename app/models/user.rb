class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :likes, dependent: :destroy

  has_many :follows
  has_many :followings, through: :follows, source: :follow
  has_many :reverse_of_follows, class_name: 'follow', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_follows, source: :user

  def follow?(other_user)
    unless self == other_user
      self.follow.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    follow = self.follow.find_by(follow_id: other_user.id)
    follow.destroy if follow
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
end
