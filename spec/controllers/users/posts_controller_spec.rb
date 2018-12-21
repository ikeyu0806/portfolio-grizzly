require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: { name: user.to_param }
      expect(response).to be_successful
    end
  end
end
