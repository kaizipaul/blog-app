class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments


  after_initialize :set_post_counter_default

  def set_post_counter_default
    self.post_counter = 0 if post_counter.nil?
  end

  private :set_post_counter_default

  def three_posts
    posts.order(created_at: :desc).limit(3)
  end
end
