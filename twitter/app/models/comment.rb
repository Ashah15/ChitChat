class Comment < ApplicationRecord
	belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  default_scope -> { order(created_at: :desc) }
  validates_presence_of :text

  has_one_attached :image
  has_many :likes, dependent: :destroy
  
  validates_presence_of :author_id
end
