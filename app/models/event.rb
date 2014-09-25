class Event < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true
  mount_uploader :event_image, ImageUploader
end
