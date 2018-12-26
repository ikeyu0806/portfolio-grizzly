module Setting
  module Profile
    class EditForm < ApplicationForm
      extend CarrierWave::Mount
      mount_uploader :avatar, AvatarUploader

      attr_accessor :user
      attribute :profile, String
      attribute :avatar, ActionDispatch::Http::UploadedFile

      def save
        user = User.find(@user.id)
        user.profile = profile
        # user.avatar = avatar
        user.avatar = avatar
        user.save
      end
    end
  end
end
