class AccountsController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id]) #サインインしているユーザーというヘルパーメソッド
  end

  def update
      @user = current_user
      if @user.update(params.require(:user).permit(:image, :name, :introduction))
        redirect_to edit_account_path
      else
        render "edit"
      end
  end
end
