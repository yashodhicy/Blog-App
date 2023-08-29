require 'rails_helper'

RSpec.describe 'user index view page', type: :system do
  let!(:user1) do
    User.create(
      name: 'test user1',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'test_bio1',
      posts_counter: 1
    )
  end

  let!(:user2) do
    User.create(
      name: 'test user2',
      photo: 'https://images.pexels.com/photos/2913125/pexels-photo-2913125.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      bio: 'test_bio2',
      posts_counter: 2
    )
  end

  let!(:user3) do
    User.create(
      name: 'test user3',
      photo: 'https://static.photocdn.pt/images/articles/2018/12/05/articles/2017_8/beginner_photography_mistakes-1.webp',
      bio: 'test_bio3',
      posts_counter: 0
    )
  end


  describe 'user content' do
    before(:example) do
      visit users_path
    end

    it 'can see all users names' do
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user2.name)
      expect(page).to have_content(user3.name)
    end

    it ' can see profile picture' do
      expect(page).to have_selector('img#user-image[src="https://unsplash.com/photos/F_-0BxGuVvo"]')
      expect(page).to have_selector('img#user-image[src="https://images.pexels.com/photos/2913125/pexels-photo-2913125.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"]')
      expect(page).to have_selector('img#user-image[src="https://static.photocdn.pt/images/articles/2018/12/05/articles/2017_8/beginner_photography_mistakes-1.webp"]')
    end

    it 'can see posts count' do
      expect(page).to have_content('Number of posts: 1')
      expect(page).to have_content('Number of posts: 2')
      expect(page).to have_content('Number of posts: 0')
    end
  end

  describe 'click on a user' do
    before(:example) do
      visit users_path
    end

    it 'redirects to user show page when clicking on user name' do
      user_link = find("a[href='#{user_path(user1)}']")
      user_link.click
      expect(page).to have_current_path(user_path(user1))
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user1.bio)
    end
  end
end
