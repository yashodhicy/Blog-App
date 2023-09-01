require 'rails_helper'

RSpec.describe 'Api::V1::Posts', type: :request do
    describe 'GET /api/v1/users/:user_id/posts' do
    let(:user) { create(:user) }
    let!(:posts) { create_list(:post, 3, user: user) }

    before { get "/api/v1/users/#{user.id}/posts" }

    it 'returns a successful response' do
      expect(response).to have_http_status(200)
    end

    it 'returns the posts for the user' do
      response_body = JSON.parse(response.body)
      expect(response_body.length).to eq(posts.length)

      response_body.each_with_index do |post_data, index|
        expect(post_data['id']).to eq(posts[index].id)
        expect(post_data['title']).to eq(posts[index].title)
        expect(post_data['content']).to eq(posts[index].content)
      end
    end
  end
end
