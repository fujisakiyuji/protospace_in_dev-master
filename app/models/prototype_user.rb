class PrototypeUser < ActiveRecord::Base
  belongs_to :prototype
  belongs_to :user
end
