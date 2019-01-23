# frozen_string_literal: true

module Setting
  module Profile
    class EditForm < ApplicationForm
      extend CarrierWave::Mount
      include ActiveModel::Validations

      mount_uploader :avatar, AvatarUploader

      attr_accessor :user
      attribute :profile, String
      attribute :avatar, ActionDispatch::Http::UploadedFile

      validates :profile, presence: true
      validates :avatar,  presence: true, file_size: { less_than: 1.megabytes }

      def save
        user = User.find(@user.id)
        user.profile = profile
        user.avatar = avatar
        user.save
      end
    end
  end
end
