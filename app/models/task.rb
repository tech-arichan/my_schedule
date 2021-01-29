class Task < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :priority
  
  with_options presence: true do
    validates :title
    validates :deadline
    validates :priority_id, numericality: { other_than: 1 }
  end
end
