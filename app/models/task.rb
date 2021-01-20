class Task < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :priority
  
  validates :title, :deadline, :priority, presence: true

  with_options numericality: { other_than: 1 } do
    validates :priority_id
  end

end
