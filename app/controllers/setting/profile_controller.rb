module Setting
  class ProfileController < ApplicationController
    before_action :set_user
    def edit
      @form = Setting::Profile::EditForm.new(user: @user)
    end

    def update
      @form = Setting::Profile::EditForm.new(
        user_params.merge(user: current_user)
      )
      @form.save
      redirect_to edit_setting_profile_path
    end

    private

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:setting_profile_edit_form).permit(:profile, :avatar)
    end
  end
end
