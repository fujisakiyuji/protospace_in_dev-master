class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, UserImageUploader


  has_many :prototypes, :through => :like
  has_many :likes

  validates :name, presence: true
end
