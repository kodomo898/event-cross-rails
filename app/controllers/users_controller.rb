class UsersController < ApplicationController
  require "utility/awss3"
  include Utils

  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

  def index
    @user = User.find_by(id: @current_user.id)
    if @user.user_group == "eventer"
      @users = User.where(user_group: "dj")
      @group = @user.user_group
    else
      @users = User.where(user_group: "eventer")
      @group = @user.user_group
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new().create_user(params[:name], params[:email], params[:user_group], params[:password])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "登録しました"
      redirect_to("/users/#{@user.id}")
    else
      render('/users/new')
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    if params[:image]
      @user.image_name = "#{@user.name}.jpg"
      image = params[:image]
      Awss3.upload_user_image(params[:image].tempfile, @user.name)
    end

    if @user.save
      flash[:notice] = "情報をアップデートしました"
      redirect_to('/users/index')
    else
      render('/users/edit')
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/users/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("/users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to('/posts/index')
    end
  end

end
