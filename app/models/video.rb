class Video < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :music_categories
  has_many :comments
  validates :title, presence: true
  validates :path, presence: true, if: -> { self.source == "local" }
  validates :remote_path, presence: true, if: -> { self.source == "remote" }
    #/(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
  validates_format_of :remote_path, :with => /(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})/  , if: -> { self.source == "remote" }
  #validates :path, presence: :source == "local"
  #validates :remote_path, presence: source == "remote"
  mount_uploader :path, VideoUploader
end
