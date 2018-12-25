module Setting
  class ProfileController < ApplicationController
    def edit
      @user = current_user
    end

    def update

    end
  end
end
