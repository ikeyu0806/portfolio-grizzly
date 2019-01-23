# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }

  describe 'GET #index' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it '正常に応答すること' do
        get :index, params: {}
        expect(response).to be_successful
      end
    end

    context 'ログインしていない場合' do
      it '正常に応答すること' do
        get :index, params: {}
        expect(response).to be_successful
      end
    end
  end

  describe 'GET #show' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it '正常に応答すること' do
        get :show, params: { name: user.to_param }
        expect(response).to be_successful
      end
    end

    context 'ログインしていない場合' do
      it '正常に応答すること' do
        get :show, params: { name: user.to_param }
        expect(response).to be_successful
      end
    end
  end
end
