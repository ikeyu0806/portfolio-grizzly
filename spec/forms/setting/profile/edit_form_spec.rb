require 'rails_helper'

RSpec.describe Setting::Profile::EditForm, type: :model do
  describe 'バリデータの確認' do
    it { is_expected.to validate_presence_of(:profile) }
    it { is_expected.to validate_presence_of(:avatar) }
  end
end
