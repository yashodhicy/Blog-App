require 'rails_helper'

RSpec.describe 'users', type: :request do
  describe 'GET /index' , type: :request do
    before(:example) { get '/users' }

    it 'displays a list of users' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template('index')
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('Here is a list of users')
    end
  end
  describe 'GET /show', type: :request do
      user = User.create(
        name: 'test user',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'test_bio',
        posts_counter: 1
      )
      before(:example) { get '/users/'+ user.id.to_s }

      it 'displays the user details for a given user' do
        expect(response).to have_http_status(200)
      end

      it 'renders the correct template' do
        expect(response).to render_template('show')
      end

      it 'includes correct placeholder text in the response body' do
        expect(response.body).to include('here is the user details')
      end
  end
end
