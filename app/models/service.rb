class Service < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :vehicle
  validates_presence_of :name
end
