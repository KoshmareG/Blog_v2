class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :article
  has_one :user
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
