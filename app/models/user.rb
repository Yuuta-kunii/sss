class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :image_icon,ImageUploader
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  
  validates :image_icon,presence: true
  validates :profile,presence: true
         
  has_many :relationships
  has_many :followings,through: :relationships,source: 'follow'
  has_many :reverse_of_relationships,class_name: 'Relationship',foreign_key: :follow_id
  has_many :followers,through: :reverse_of_relationships,source: 'user'
  
  def follow(other_user)
    unless self == other_user
      relationships.find_or_create_by(follow: other_user)
    end
  end
  
  def unfollow(relationship_id)
     relationships.find(relationship_id).destroy if relationships
  end
  
  def following?(other_user)
    followings.include?(other_user)
  end
  
  def matcher
    User.where(id: reverse_of_relationships.select(:user_id))
     .where(id: relationships.select(:follow_id))
  end 


  
end
