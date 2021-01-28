class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true
  has_many :events, dependent: :destroy
  has_many :memos, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :storages

  def self.guest
    find_or_create_by!(email: 'guest@example.com', name:'Guest') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

end
