class RelationsController < ApplicationController
  def create
    @user = User.find(params[:relation][:follow_id])
    current_user.follow(@user)
    redirect_to @user
  end

  def destroy
    @user = Relation.find(params[:id]).followed
    current_user.unfollow(@user)
    redirect_to @user
  end
end
