require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/1/posts' }

    it 'displays a list of posts' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template('index')
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('Here is a list of posts')
    end

    describe 'GET /show', type: :request do
      before(:example) { get '/users/1/posts/1' }
      it 'displays the post details for a given post' do
        expect(response).to have_http_status(200)
      end

      it 'renders the correct template' do
        expect(response).to render_template('show')
      end

      it 'includes correct placeholder text in the response body' do
        expect(response.body).to include('Here is a list of posts for a given user')
      end
    end
  end
end
