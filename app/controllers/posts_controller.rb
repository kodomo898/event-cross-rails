class PostsController < ApplicationController
  before_action :authenticate_user


  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def show
    if @post = Post.find(params[:id])
      @user = User.find(@post.user_id)
    else
      flash[:notice] = "投稿が見つかりません"
      redirect_to posts_path
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to posts_path
    else
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿を修正しました"
      redirect_to posts_path
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "削除しました"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(
      :content
    )
  end

end
