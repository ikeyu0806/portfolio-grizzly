require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:post_user) { create(:user1) }
  let!(:comment_user) { create(:user2) }
  let!(:post) { create(:post, user: post_user) }
  let!(:comment) { create(:comment, post: post, user: user) }
  let(:valid_attributes) do
    {
      content: 'content',
      user_id: comment_user.id,
      post_id: post_user.id
    }
  end
  # let(:valid_attributes) do
  #   {
  #     comment: {
  #       content: 'content'
  #     }
  #   }
  # end

  before do
    sign_in comment_user
  end

  describe 'GET #create' do
    it '正常に応答すること' do
      expect do
        # post :create, params: valid_attributes
        post :create
      end.to change(Comment, :count).by(1)
    end

    it '記事作成ページにリダイレクトすること' do
      post :create, params: { post: valid_attributes }
      expect(response).to redirect_to(Post.last)
    end
  end

  describe 'GET #destroy' do
    let!(:comment) { create(:comment, user: comment_user, post: post) }
    it '正常に応答すること' do
      expect do
        delete :destroy, params: { id: comment.id }
      end.to change(Comment, :count).by(-1)
    end
  end
end
