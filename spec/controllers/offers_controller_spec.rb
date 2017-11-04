require 'rails_helper'

RSpec.describe OffersController, type: :controller do
  let(:location) { create :location }
  let(:user) { location.user }

  before(:each) do
    login_with user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
