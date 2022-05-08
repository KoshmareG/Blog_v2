class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :article
  has_one :user
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :likes, dependent: :destroy

  validates :avatar, file_size: { less_than_or_equal_to: 10.megabytes },
            file_content_type: { allow: ['image/jpeg', 'image/png', 'image/webp'] }
end
