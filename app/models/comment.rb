class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true

  validates :content, presence: true

  scope :approved, -> { where(approved: true) }
end
