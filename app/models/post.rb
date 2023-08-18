class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :comments
  has_many :likes

  after_create :update_user_post_count
  after_create :recent_comments

  def update_user_post_count
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
