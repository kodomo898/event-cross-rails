class User < ApplicationRecord
  has_secure_password

  validates :name, {presence: true, uniqueness: true}
  validates :email, {presence: true}
  validates :user_group, {presence: true}

  def create_user(name_param, email_param, image_param, user_group_param, password_param)
    @user_new = User.new(
      name: name_param,
      email: email_param,
      image_name: image_param,
      user_group: user_group_param,
      password: password_param)
  end
end
