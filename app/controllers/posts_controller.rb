class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.
    # 自分のユーザだけに絞ること（自分のだけ見れる）
    # 新規登録時はpostにcurrent_userを紐付けて保存
    # 編集画面で自分の以外はひらけないようにする
    # save、updateも同様
    # deleteも自分のだけ
    # post_contrillerは自分のだけ扱えるもの
  end

  def show
  end

  def new
    @post = Post.new
    @post.user = current_user
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html do
          redirect_to @post, notice: 'Post was successfully created.'
        end
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html do
          redirect_to @post, notice: 'Post was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html do
        redirect_to posts_url,
                    notice: 'Post was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
