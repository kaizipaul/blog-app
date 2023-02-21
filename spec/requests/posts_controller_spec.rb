require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'posts index action' do
    before :each do
      @user = User.create(name: 'Lauren', photo: 'https://unsplash.com/photos/i2hoD-C2RUA', bio: 'Engineer in England',
                          post_counter: 1)
      get "/users/#{@user.id}/posts"
    end
  end

  describe 'post show action' do
    before :each do
      @user = User.create(name: 'Lauren', photo: 'https://unsplash.com/photos/i2hoD-C2RUA', bio: 'Engineer in England',
                          post_counter: 1)
      @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post',
                          author_id: @user.id, likes_counter: 0, comments_counter: 0)
      get "/users/#{@user.id}/posts/#{@post.id}"
    end

    it 'should check if correct index template is rendered' do
      expect(response).to render_template(:show)
    end
  end
end
