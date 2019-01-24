# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:login_user) { create(:user1) }
  let(:post_user) { create(:user2) }
  let(:user_post) { create(:post,  user: post_user) }

  describe 'バリデータの確認' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
  end

  describe 'likeに対する操作の確認' do
    it 'いいねが作成されること' do
      expect { user_post.like(login_user) }.to change(Like, :count).by(1)
    end
  end

  describe 'unlikeに対する操作の確認' do
    context 'いいね済みのユーザの場合' do
      before do
        create(:like, user: login_user, post: user_post)
      end

      it 'いいねが取り消されること' do
        expect { user_post.unlike(login_user) }.to change(Like, :count).by(-1)
      end
    end

    context 'いいねしていないユーザの場合' do
      it '何も起きないこと' do
        expect { user_post.unlike(login_user) }.not_to change(Like, :count)
      end
    end
  end

  describe 'post_user?メソッドの確認' do
    it '記事を書いたユーザに対してtrueが返ること' do
      expect(user_post.post_user?(post_user)).to be true
    end

    it '記事を書いていないユーザに対してfalseが返ること' do
      expect(user_post.post_user?(login_user)).to be false
    end
  end
end
