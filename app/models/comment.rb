class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  default_scope {where.not(id: nil)}
end
