class Task < ApplicationRecord
  validates :title, :deadline, :priority, presence: true
end
