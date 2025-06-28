# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "ログインしました"
  end

  def destroy
    super
    flash[:notice] = "ログアウトしました"
  end
end