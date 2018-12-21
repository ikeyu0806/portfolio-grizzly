require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { name: user.to_param }
      expect(response).to be_successful
    end
  end
end
