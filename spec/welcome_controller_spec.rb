require "rails_helper"

RSpec.describe WelcomeController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #search" do
    it "responds successfully with an HTTP 200 status code" do
      get :search, q: ''
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :search, q: 'asdf'
      expect(response).to render_template("index")
    end
  end

end
