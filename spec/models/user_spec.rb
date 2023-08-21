require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(
    name: 'test user',
    photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
    bio: 'test_bio',
    posts_counter: 1
  )
  describe 'validations' do
    it 'should validate name' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'should validate post_counter is a integer' do
      user.posts_counter = 'w'
      expect(user).to_not be_valid
    end

    it 'should validate post_counter greater than or equal zero' do
      user.posts_counter = -1
      expect(user).to_not be_valid
    end
  end

  describe 'test methods' do
    it 'shows recents 3 posts' do
      expect(user.recent_posts).to eq(user.posts.last(3))
    end
  end
end
