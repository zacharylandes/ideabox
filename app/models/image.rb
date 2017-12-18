class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user, optional: true
  has_and_belongs_to_many :ideas, :dependent => :destroy
end
