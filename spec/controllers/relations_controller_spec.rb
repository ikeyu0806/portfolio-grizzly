require 'rails_helper'

RSpec.describe RelationsController, type: :controller do
  let!(:user1) { create(:user1) }
  let!(:user2) { create(:user2) }
  let(:create_params) do
    {
      relation: {
        follow_id: 2
      }
    }
  end

  before do
    sign_in user1
  end

  describe 'GET #create' do
    it '正常に応答すること' do
      expect do
        post :create, params: create_params
      end.to change(Relation, :count).by(1)
    end
  end

  describe 'GET #destroy' do
    let!(:relation) { create(:relation) }
    it '正常に応答すること' do
      expect do
        delete :destroy, params: { id: relation.to_param }
      end.to change(Relation, :count).by(-1)
    end
  end
end
