require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    user1 = User.new(name: 'test user', photo: 'test.png', bio: 'bio', posts_counter: 0)
    user2 = User.new(name: 'test user', photo: 'test.png', bio: 'bio', posts_counter: 0)
    post = Post.new(title: 'test post', text: 'Good evening', author: user1, likes_counter: 1, comments_counter: 1)
    comment = Comment.create(post:, user: user2, text: 'Hi Tom!')

    it 'should increase comments count' do
      expect do
        comment.update_comments_counter
      end.to change(post, :comments_counter).by(1)
    end
  end
end
