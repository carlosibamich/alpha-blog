class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :body, presence: true, length: { minimum: 100, maximum: 3000 }
  validates :user_id, presence: true
end
