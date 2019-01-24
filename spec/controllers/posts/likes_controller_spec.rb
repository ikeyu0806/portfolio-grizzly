# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Posts::LikesController, type: :controller do
  let!(:post_user) { create(:user1) }
  let!(:like_user) { create(:user2) }
  let!(:liked_post) { create(:post, user: post_user) }
  let!(:like) { create(:like, post: liked_post) }
  let(:create_params) do
    {
      post_id: liked_post.id,
      like: {
        user: post_user,
        post: liked_post
      }
    }
  end

  before do
    sign_in like_user
  end

  describe 'GET #create' do
    it '正常に応答すること' do
      expect do
        post :create, params: create_params
      end.to change(Like, :count).by(1)
    end
  end

  describe 'GET #destroy' do
    let(:delete_params) do
      {
        id: like.id,
        post_id: liked_post.id,
        user_id: like_user.id
      }
    end

    it '正常に応答すること' do
      expect do
        delete :destroy, params: delete_params
      end.to change(Like, :count).by(-1)
    end
  end
end
