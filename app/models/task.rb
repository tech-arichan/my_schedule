class Task < ApplicationRecord
  belongs_to :user
  belongs_to_active_hash :priority_id
end
