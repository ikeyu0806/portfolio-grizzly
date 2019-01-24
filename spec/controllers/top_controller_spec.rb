# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TopController, type: :controller do
  let!(:user) { create(:user) }

  describe 'GET #index' do
    context 'ログインしている場合' do
      before do
        sign_in user
        FactoryBot.create_list(:post, 11, user: user)
      end

      it '正常に応答すること' do
        get :index
        expect(response).to have_http_status(:success)
      end

      it '表示数が10であること' do
        get :index
        expect(assigns(:recent_posts).count).to eq 10
      end
    end

    context 'ログインしていない場合' do
      before do
        FactoryBot.create_list(:post, 11, user: user)
      end

      it '正常に応答すること' do
        get :index
        expect(response).to have_http_status(:success)
      end

      it '表示数が10であること' do
        get :index
        expect(assigns(:recent_posts).count).to eq 10
      end
    end
  end
end
