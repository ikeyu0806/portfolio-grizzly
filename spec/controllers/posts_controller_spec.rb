require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let!(:user) { create(:user) }

  let(:valid_attributes) do
    {
      title: 'title',
      content: 'content',
      user: user
    }
  end

  let(:invalid_attributes) do
    {
      title: '',
      content: '',
      user: user
    }
  end

  describe 'GET #index' do
    it '正常に応答すること' do
      Post.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it '正常に応答すること' do
      post = Post.create! valid_attributes
      get :show, params: { id: post.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      it '正常に応答すること' do
        get :new, params: {}
        expect(response).to be_successful
      end
    end

    context 'ログインしていない場合' do
      it 'ログインページに遷移すること' do
        get :new, params: {}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET #edit' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      it '正常に応答すること' do
        post = Post.create! valid_attributes
        get :edit, params: { id: post.to_param }
        expect(response).to be_successful
      end
    end
    context 'ログインページに遷移すること' do
      it '正常に応答すること' do
        post = Post.create! valid_attributes
        get :edit, params: { id: post.to_param }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      context '正常なパラメータの場合' do
        it '記事を作成する時' do
          expect do
            post :create, params: { post: valid_attributes }
          end.to change(Post, :count).by(1)
        end

        it '記事作成ページにリダイレクトすること' do
          post :create, params: { post: valid_attributes }
          expect(response).to redirect_to(Post.last)
        end
      end

      context '不正なパラメータの場合' do
        it "正常に応答すること" do
          post :create, params: { post: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end

    context 'ログインしていない場合' do
      it 'ログインページに遷移すること' do
        post :create, params: { post: valid_attributes }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'PUT #update' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      context '正常なパラメータの場合' do
        let(:new_attributes) do
          {
            title: 'new_title',
            content: 'new_content'
          }
        end
        it '想定通りに更新されること' do
          post = Post.create! valid_attributes
          put :update, params: { id: post.to_param, post: new_attributes }
          post.reload
          expect(post).to have_attributes(new_attributes)
        end
        it '記事一覧ページに遷移すること' do
          post = Post.create! valid_attributes
          put :update, params: { id: post.to_param, post: valid_attributes }
          expect(response).to redirect_to(post)
        end
      end
      context '不正なパラメータの場合' do
        it "returns a success response (i.e. to display the 'edit' template)" do
          post = Post.create! valid_attributes
          put :update, params: { id: post.to_param, post: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end

    context 'ログインしていない場合' do
      context 'with valid params' do
        let(:new_attributes) do
          {
            title: 'new_title',
            content: 'new_content'
          }
        end
        it 'ログイン画面に遷移すること' do
          post = Post.create! valid_attributes
          put :update, params: { id: post.to_param, post: valid_attributes }
          expect(response).to redirect_to new_user_session_path
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      it '記事が削除されること' do
        post = Post.create! valid_attributes
        expect do
          delete :destroy, params: { id: post.to_param }
        end.to change(Post, :count).by(-1)
      end

      it '記事一覧ページにリダイレクトすること' do
        post = Post.create! valid_attributes
        delete :destroy, params: { id: post.to_param }
        expect(response).to redirect_to(posts_url)
      end
    end

    context 'ログインしていない場合' do
      it 'ログインページに遷移すること' do
        post = Post.create! valid_attributes
        delete :destroy, params: { id: post.to_param }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
