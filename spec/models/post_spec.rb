require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(
    name: 'test user',
    photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
    bio: 'test_bio',
    posts_counter: 1
  )

  post = Post.new(
    author: user,
    title: 'Hello',
    text: 'This is my test post'
  )

  describe 'validations in Post' do
    it 'check the title is not blank' do
      post.title = nil
      expect(post).to_not be_valid
    end

    it 'should validate the title is not exceeding 250 characters' do
      post.title = 'test hello test hello test hello test hello test hello test hello test hello test hello
        test hello test hello test hello test hello test hello test hello test hello test hello test hello Hello
        test hello test hello test hello test hello test hello test hello test hello test hello test hello test hello'

      expect(post).to_not be_valid
    end

    it 'should validate comments counter is numeric' do
      post.comments_counter = 'not-numeric'
      expect(post).to_not be_valid
    end

    it 'should validate likes counter is numeric' do
      post.likes_counter = 'not-numeric'
      expect(post).to_not be_valid
    end

    it 'should validate likes counter is equal or greater than zero' do
      expect(post.likes_counter).to be >= 0
    end

    it 'should validate comments counter is equal or greater than zero' do
      expect(post.comments_counter).to be >= 0
    end
  end
  describe 'methods in Post' do
    it 'update_user_post_count' do
      expect do
        post.update_user_post_count
      end.to change(user, :posts_counter).by(1)
    end

    it 'get recent 5 comments' do
      expect(post.recent_comments).to eq(post.comments.last(5))
      puts post.comments.last(5)
    end
  end
end
