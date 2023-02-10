require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher')
    @post = Post.create(title: 'Hi', text: 'My world', author: @user, likes_counter: 1, comments_counter: 1)
    @comment = Comment.create(post: @post, author: @user, text: 'hello yimi', post_id: 1)
  end

  it 'checks if attributes are valid' do
    expect(@user).to be_valid
  end

  it 'checks if attributes are valid' do
    expect(@post).to be_valid
  end

  it 'checks if comment creation is valid' do
    expect(@comment).to_not be_valid
  end
end
