class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, UserImageUploader

  has_many :prototypes
  has_many :likes
  # has_many :prototypes, :through => :like
    # :through => :like#多対多

  validates :name, presence: true
end
