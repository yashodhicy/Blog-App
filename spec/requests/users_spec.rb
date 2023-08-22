require 'rails_helper'

RSpec.describe "users", type: :request do
  describe "GET /index" do
    before (:example) {get '/users'}
    
    it "displays a list of users" do
      expect(response).to have_http_status(200)
    end

    it "renders the correct template" do
      expect(response).to render_template('index')
    end

    it "includes correct placeholder text in the response body" do
      expect(response.body).to include('Here is a list of users')
    end

    describe "GET /show", type: :request do
      before (:example) {get '/users/1'}
      it "displays the user details for a given user" do
        expect(response).to have_http_status(200)
      end
  
      it "renders the correct template" do
        expect(response).to render_template('show')
      end
  
      it "includes correct placeholder text in the response body" do
        expect(response.body).to include('here is the user details')
      end
    end
  end
end

