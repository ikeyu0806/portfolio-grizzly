require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:post_user) { create(:user1) }
  let!(:comment_user) { create(:user2) }
  let!(:other_user) { create(:user3) }
  let!(:commented_post) { create(:post, user: post_user) }
  let!(:comment) { create(:comment, user: comment_user, post: commented_post) }

  it '記事を書いたユーザがコメントを削除できないこと' do
    expect(comment.destroyable?(post_user)).to be true
  end

  it 'コメントを書いたユーザがコメントを削除可能できること' do
    expect(comment.destroyable?(comment_user)).to be true
  end

  it '記事ともコメントとも無関係なユーザがコメントを削除できないこと' do
    expect(comment.destroyable?(other_user)).to be false
  end
end
