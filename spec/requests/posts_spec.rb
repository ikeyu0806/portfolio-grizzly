# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /posts' do
    it 'works! (now write some real specs)' do
      get posts_path
      expect(response).to have_http_status(:ok)
    end
  end
end
