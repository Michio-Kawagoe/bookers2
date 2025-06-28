class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    flash[:success] = "ユーザー登録が完了しました"
  end
end