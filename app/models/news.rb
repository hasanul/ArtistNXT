class News < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  mount_uploader :news_image, ImageUploader
end
