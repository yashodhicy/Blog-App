require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    user1 = User.new(name: 'test user', photo: 'test.png', bio: 'bio', posts_counter: 0)
    user2 = User.new(name: 'test user', photo: 'test.png', bio: 'bio', posts_counter: 0)
    post = Post.new(title: 'test post', text: 'Good evening', author: user1, likes_counter: 1, comments_counter: 1)
    like = Like.create(post:, user: user2)

    it 'should increase comments count' do
      expect do
        like.update_likes_counter
      end.to change(post, :likes_counter).by(1)
    end
  end
end
