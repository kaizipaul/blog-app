require 'rails_helper'

RSpec.describe 'Post Page Index', type: :feature do
  before :each do
    @kyle = User.create(
      name: 'Kyle',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Artist',
      post_counter: 1
    )
    @post = Post.create(title: 'Hello', text: 'My world', comments_counter: 0, likes_counter: 0,
                        author_id: @kyle.id)
    5.times do
      Comment.create(post: @post, author: @kyle, text: 'gone fishing', post_id: @post.id,
                     author_id: @kyle.id)
    end
    visit user_posts_path(@kyle.id)
  end

  it 'shows the profile picture of the user' do
    assert page.has_xpath?("//img[@src =  'https://unsplash.com/photos/F_-0BxGuVvo'
    and @alt='user photo']")
  end

  it 'shows the username of user' do
    expect(page).to have_content(@kyle.name)
  end

  it 'shows number of posts of user' do
    expect(page).to have_content('Number of posts: 1')
  end

  it 'shows the title of a post' do
    expect(page).to have_content(@post.title)
  end

  it 'shows the body of a post' do
    expect(page).to have_content('My world')
  end

  it 'shows first comments on a post' do
    expect(page).to have_content('gone fishing')
  end

  it 'shows number of comments for a post' do
    expect(page).to have_content('Comments: 5')
  end

  it 'shows number of likes for a post' do
    expect(page).to have_content('Likes: 0')
  end

  it 'shows section for pagination' do
    expect(page).to have_content('Pagination')
  end

  it 'redirects to posts show page' do
    click_on 'Hello'
    expect(page).to have_current_path user_post_path(@kyle.id, @post.id)
  end
end
