class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  validates :name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_initialize :set_post_counter_default

  def set_post_counter_default
    self.post_counter = 0 if post_counter.nil?
  end

  private :set_post_counter_default

  def three_posts
    posts.order(created_at: :desc).limit(3)
  end
end
