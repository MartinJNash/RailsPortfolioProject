class ContactMessage
  include ActiveModel::Model
  attr_accessor :email, :name, :body

  validates :email, presence: true, format: { with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\Z/i }
  validates :name, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 1000 }
end
