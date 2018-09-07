class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :prototype
  belongs_to :captured_images
end
