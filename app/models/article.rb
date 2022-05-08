class Article < ApplicationRecord
    has_many :comments, :dependent => :delete_all
    has_many :likes, dependent: :destroy
    belongs_to :user

    default_scope {order(id: :desc)}
    validates :title, presence: true, length: { maximum: 130 }
    validates :text, presence: true
end
