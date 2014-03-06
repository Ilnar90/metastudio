class Micropost < ActiveRecord::Base
  attr_accessible :title, :content
  belongs_to :user
  has_many :micropost_votes
  default_scope -> { order('created_at DESC')}
  validates :title, presence: true, length: { maximum: 70 }
  validates :content, presence: true, length: { maximum: 500 }
  validates :user_id, presence: true
  has_reputation :votes, source: :user, aggregated_by: :sum
  def self.by_votes
    all.sort_by {|m| -m.reputation_for(:votes)}
  end

  def votes
    read_attribute(:votes)
  end
end
