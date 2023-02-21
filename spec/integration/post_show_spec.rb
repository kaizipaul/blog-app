require 'rails_helper'

RSpec.describe 'Post Page Index', type: :feature do
  before :each do
    @kyle = User.create(
      name: 'Kyle',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher',
      post_counter: 3
    )
    @post = Post.create(title: 'Hello', text: 'My world', comments_counter: 0, likes_counter: 0,
                        author_id: @kyle.id)
    5.times do
      Comment.create(post: @post, author: @kyle, text: 'gone fishing', post_id: @post.id,
                     author_id: @kyle.id)
    end
    visit user_post_path(@kyle.id, @post.id)
  end

  it 'shows the title of a post' do
    expect(page).to have_content(@post.title)
  end

  it 'shows the writer of the post' do
    expect(page).to have_content("by #{@kyle.name}")
  end

  it 'shows the number of comments for the post' do
    expect(page).to have_content('Comments: 5')
  end

  it 'shows the number of likes for the post' do
    expect(page).to have_content('Likes: 0')
  end

  it 'shows the body of the post' do
    expect(page).to have_content('My world')
  end

  it 'shows the username of each commentor' do
    expect(page).to have_content(@kyle.name)
  end

  it 'shows comment of each commentor' do
    expect(page).to have_content('gone fishing')
  end
end
