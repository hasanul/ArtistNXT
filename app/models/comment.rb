class Comment < ActiveRecord::Base
  belongs_to :video
  validates :body, presence: true,length: { minimum: 20 }
  validates :video_id, presence: true, numericality: { only_integer: true,greater_than: 0 }
end
