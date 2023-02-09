require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher')
  end

  it 'name must not be blank' do
    @user.name = nil
    expect(@user).to be_valid
  end

  it 'check if posts counter is an integer' do
    @user.post_counter = 'ham'
    expect(@user).to be_valid
  end

  it 'checks if bio is present' do
    @user.bio = 'hello'
    expect(@user).to be_valid
  end
end
