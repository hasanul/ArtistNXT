class AdminNews < ActiveRecord::Base
  validates :title, presence: true
end
