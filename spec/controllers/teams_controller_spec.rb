require 'rails_helper'

RSpec.describe TeamsController, type: :controller do

  describe "GET #standings" do
    it "returns http success" do
      get :standings
      expect(response).to have_http_status(:success)
    end
  end

end
