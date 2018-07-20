class User < ApplicationRecord
  has_secure_password

  validates :name, {presence: true, uniqueness: true}
  validates :email, {presence: true}

  def create_user(name_param, email_param, user_group_param, password_param)
    @user = User.new(
      name: name_param,
      email: email_param,
      image_name: "default_user.jpg",
      user_group: user_group_param,
      password: password_param)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "登録しました"
      redirect_to("/users/#{@user.id}")
    else
      render('/users/new')
    end
  end
end
