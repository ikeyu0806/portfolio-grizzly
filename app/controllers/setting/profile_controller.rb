module Setting
  class ProfileController < ApplicationController
    def edit
      @form = Setting::Profile::EditForm.new
      @test = 1
    end

    def update
      @form = Setting::Profile::EditForm.new
    end

    private

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:setting_profile_edit_form).permit(:profile)
    end
  end
end
