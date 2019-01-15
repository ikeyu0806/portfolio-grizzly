require 'rails_helper'

RSpec.describe Setting::ProfileController, type: :controller do
  let!(:user) { create(:user) }

  describe 'GET #edit' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      it '正常に応答すること' do
        get :edit, params: { id: user.to_param }
        expect(response).to be_successful
      end
    end

    context 'ログインしていない場合' do
      it '正常に応答すること' do
        get :edit, params: { id: user.to_param }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
