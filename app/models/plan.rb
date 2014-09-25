class Plan < ActiveRecord::Base
  validates :name, presence: true
end
