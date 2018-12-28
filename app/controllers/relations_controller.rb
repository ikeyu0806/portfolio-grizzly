class RelationsController < ApplicationController
  def create
    @user = User.find(params[:relation][:follow_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    Rails.logger.info("!!!!!!!!!!!!")
    Rails.logger.info(params[:id])
    Rails.logger.info("!!!!!!!!!!!!")
    Rails.logger.info(Relation.find(params[:id]).followed.name)
    Rails.logger.info(Relation.find(params[:id]).follower.name)
    @user = Relation.find(params[:id]).followed
    Rails.logger.info("!!!!!!!!!!!!@user")
    Rails.logger.info(@user.name)
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
