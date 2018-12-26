module Setting
  module Profile
    class EditForm < ApplicationForm
      attr_accessor :user
      attribute :profile, :string
      attribute :avatar, :string

      def save
        user = User.find(@user.id)
        user.profile = profile
        # user.avatar = avatar
        user.avatar = @original_filename
        user.save
      end
    end
  end
end
