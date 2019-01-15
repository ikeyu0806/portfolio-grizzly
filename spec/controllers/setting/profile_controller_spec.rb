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

  describe 'PUT #update' do
    let(:image_path) { File.join(Rails.root, 'spec/fixtures/icon.svg') }
    let(:new_avatar) { Rack::Test::UploadedFile.new(image_path) }
    let(:new_form_params) do
      {
        profile: 'new_profile',
        avatar: new_avatar
      }
    end
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      it '想定通りに更新されること' do
        put :update, params: { user: user, setting_profile_edit_form: new_form_params }
        user.reload
        user_attributes = {
          profile: new_form_params[:profile]
        }
        expect(user).to have_attributes(user_attributes)
      end
      it '設定ページに遷移すること' do
        put :update, params: { user: user, setting_profile_edit_form: new_form_params }
        expect(response).to redirect_to edit_setting_profile_path
      end
    end

    context 'ログインしていない場合' do
      it 'ログインページに遷移すること' do
        put :update, params: { user: user, setting_profile_edit_form: new_form_params }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
