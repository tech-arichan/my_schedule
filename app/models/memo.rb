class Memo < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :memo
    validates :user_id
  end
end
