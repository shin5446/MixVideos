class ApplicationController < ActionController::Base
   # deviseコントローラーにストロングパラメータを追加
   before_action :configure_permitted_parameters, if: :devise_controller?

   protected
   def configure_permitted_parameters
     # サインアップ時にnameのストロングパラメータを追加
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
     # アカウント編集の時にnameとiconとintroductionのストロングパラメータを追加
     devise_parameter_sanitizer.permit(:account_update, keys: [:name, :icon, :introduction])
   end

   def after_sign_in_path_for(resource)
     # ログイン後動画一覧画面にリダイレクト
    videos_path
   end
end
