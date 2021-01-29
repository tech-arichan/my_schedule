class Memo < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :memo
  end
end
