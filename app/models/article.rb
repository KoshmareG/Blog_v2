class Article < ApplicationRecord
    has_many :comments, :dependent => :delete_all
    has_many :likes, dependent: :destroy
    belongs_to :user

    has_rich_text :text

    default_scope {order(id: :desc)}
    validates :title, presence: true, length: { maximum: 130 }
    validates :text, presence: true

    def last_comment
        comments.first
    end
end
