class Event < ApplicationRecord
  belongs_to :user
  
  with_options presence: true do
    validates :title
    validates :content
    validates :user_id
  end
end
