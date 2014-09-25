class Slide < ActiveRecord::Base
  validates :title, presence: true
  mount_uploader :slide_image, ImageUploader
end
