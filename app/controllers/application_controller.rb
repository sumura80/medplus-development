class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search, expect: [:search]
	
	def search
	  #これ原型=> @search = Article.search(params[:q])
    @query = Post.ransack(params[:q]) #ransackメソッド推奨
	end



  # 下記のコードで名前の変更はできるようにしてあるが、今回は変更出来ない仕様
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end



  
end
