# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Setting::ProfileController, type: :controller do
  let(:user) { create(:user) }

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
    let(:uploaded_file) do
      fixture_file_upload('spec/fixtures/icon.jpg', 'image/jpeg')
    end
    let(:new_form_params) do
      {
        profile: 'new_profile',
        avatar: uploaded_file
      }
    end

    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it '想定通りに更新されること' do
        put :update, params: { user: user, setting_profile_edit_form: new_form_params }
        user_attributes = { profile: new_form_params[:profile] }
        user.reload
        expect(user).to have_attributes(user_attributes)
      end

      it '画像が想定通りに更新されること' do
        put :update, params: { user: user, setting_profile_edit_form: new_form_params }
        user_attributes = { profile: new_form_params[:profile] }
        user.reload
        expect(user.avatar.url).to eq "/uploads/user/avatar/#{user.id}/icon.jpg"
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
