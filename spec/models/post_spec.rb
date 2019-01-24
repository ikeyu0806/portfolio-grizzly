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

  describe 'post_user?メソッドの確認' do
    it '記事を書いたユーザに対してtrueが返ること' do
      expect(user_post.post_user?(post_user)).to be true
    end

    it '記事を書いていないユーザに対してfalseが返ること' do
      expect(user_post.post_user?(login_user)).to be false
    end
  end
end
