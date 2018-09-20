class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, UserImageUploader


  has_many :prototypes, :through => :likes
  has_many :likes

  has_many :comments


  validates :name, presence: true
end
