# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Posts::CommentsController, type: :controller do
  let!(:post_user) { create(:user1) }
  let!(:comment_user) { create(:user2) }
  let!(:commented_post) { create(:post, user: post_user) }
  let(:valid_attributes) do
    {
      post_id: commented_post.id,
      comment: {
        content: 'content'
      }
    }
  end

  describe 'GET #create' do
    context 'ログインしている場合' do
      before do
        sign_in comment_user
      end

      it 'コメントが作成されること' do
        expect do
          post :create, params: valid_attributes
        end.to change(Comment, :count).by(1)
      end

      it '記事作成ページにリダイレクトすること' do
        post :create, params: valid_attributes
        expect(response).to redirect_to root_path
      end
    end

    context 'ログインしていない場合' do
      it 'コメントが作成されないこと' do
        expect do
          post :create, params: valid_attributes
        end.not_to change(Comment, :count)
      end
    end
  end

  describe 'GET #destroy' do
    let(:delete_params) do
      {
        id: comment.id,
        post_id: commented_post.id
      }
    end

    context 'ログインしている場合' do
      before do
        sign_in comment_user
      end

      let!(:comment) { create(:comment, user: comment_user, post: commented_post) }

      it 'コメントが削除されること' do
        expect do
          delete :destroy, params: delete_params
        end.to change(Comment, :count).by(-1)
      end
    end

    context 'ログインしていない場合' do
      let!(:comment) { create(:comment, user: comment_user, post: commented_post) }

      it 'コメントが削除されないこと' do
        expect do
          delete :destroy, params: delete_params
        end.not_to change(Comment, :count)
      end
    end
  end
end
