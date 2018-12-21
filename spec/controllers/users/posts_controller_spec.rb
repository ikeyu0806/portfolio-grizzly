require 'rails_helper'

RSpec.describe Users::PostsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: { user_name: user.to_param }
      expect(response).to be_successful
    end
  end
end
