class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :body, presence: true

  default_scope {where.not(id: nil).order(id: :desc)}
end
