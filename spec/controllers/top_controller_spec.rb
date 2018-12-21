require 'rails_helper'

RSpec.describe TopController, type: :controller do
  let!(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    let!(:created_posts) do
      FactoryBot.create_list(:post, 11, user: user)
    end

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "表示数が10であること" do
      get :index
      expect(assigns(:recent_posts).count).to eq 10
    end
  end
end