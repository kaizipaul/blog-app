require 'rails_helper'

RSpec.describe 'User Page Index', type: :feature do
  before :each do
    @kyle = User.create(
      name: 'Kyle',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Artist',
      post_counter: 3
    )
    @lauren = User.create(
      name: 'Lauren',
      photo: 'https://unsplash.com/photos/i2hoD-C2RUA',
      bio: 'Engineer',
      post_counter: 0
    )
    visit root_path
  end

  it 'shows username of users' do
    expect(page).to have_content(@kyle.name)
    expect(page).to have_content(@lauren.name)
  end

  it 'shows the photo of each user' do
    assert page.has_xpath?("//img[@src = 'https://unsplash.com/photos/F_-0BxGuVvo'
    and @alt='user photo']")
    assert page.has_xpath?("//img[@src = 'https://unsplash.com/photos/i2hoD-C2RUA'
    and @alt = 'user photo']")
  end

  it 'shows the users posts' do
    expect(page).to have_content('Number of posts: 3')
  end
end
