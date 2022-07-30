class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?     
  before_action :configure_account_update_parameters, if: :devise_controller? #編集機能について
      
private  

def configure_permitted_parameters  
  devise_parameter_sanitizer.permit(:sign_up,keys:[:name, :introduction])  #sign_up(ログイン？)の時はnameとintroductionを許可してくれる  
end

def configure_account_update_parameters
  devise_parameter_sanitizer.permit(:account_update,keys:[:name, :introduction, :image]) #updateで許すUserモデルのカラムだと思う
end

# imageという画像を保存する許可
#private  #private = クラスの外からは呼び出せない

#def test_params
#  params.require(:post).permit(:text, :image)
#end
end  

  