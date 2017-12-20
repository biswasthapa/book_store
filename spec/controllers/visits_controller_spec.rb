require 'rails_helper'

RSpec.describe VisitsController, type: :controller do
  login_user

  let(:valid_attributes) {
    { "ip": "192.168.0.1",
      "referrer": "google.com",
      "landing_page": "bookstore.com",
      "browser": "chrome",
      "started_at": Time.now
    }
  }


  describe "GET #index" do
    it "assigns all visits as @visits" do
      visit = Visit.create! valid_attributes
      get :index
      expect(assigns(:visits)).to eq([visit])
    end
  end
end
