class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?     
  before_action :configure_account_update_parameters, if: :devise_controller? #編集機能について
  before_action :search

private  

def configure_permitted_parameters  
  devise_parameter_sanitizer.permit(:sign_up,keys:[:name, :introduction])  #sign_up(ログイン？)の時はnameとintroductionを許可してくれる  
end

def configure_account_update_parameters
  devise_parameter_sanitizer.permit(:account_update,keys:[:name, :introduction, :image]) #updateで許すUserモデルのカラムだと思う
end

def search
  @user = current_user
  @q = Room.ransack(params[:q])
  @results = @q.result
  @count = @results.count
end


end  

  