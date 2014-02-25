class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC')}
  validates :title, presence: true, length: { maximum: 70 }
  validates :content, presence: true, length: { maximum: 500 }
  validates :user_id, presence: true
end
