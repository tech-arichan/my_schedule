class Storage < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  with_options presence: true do
    validates :title
    validates :images
    validates :user_id
  end
end
