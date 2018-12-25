module Setting
  module Profile
    class EditForm < ApplicationForm
      # attribute :user,    User
      # attribute :avatar,   String
      attribute :profile, :string

      profile = 'test'
    end
  end
end
