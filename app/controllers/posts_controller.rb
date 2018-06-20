class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def create
    @post = Post.new(content: params[:content])
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to("/posts/index")
    else
      render('posts/new')
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を修正しました"
      redirect_to("/posts/index")
    else
      render("/posts/#{@post.id}/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "削除しました"
    redirect_to("/posts/index")
  end
end
