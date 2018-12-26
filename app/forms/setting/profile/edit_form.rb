module Setting
  module Profile
    class EditForm < ApplicationForm
      attr_accessor :user
      attribute :profile, :string

      def save
        user = User.find(@user.id)
        user.profile = profile
        user.save
      end
    end
  end
end
