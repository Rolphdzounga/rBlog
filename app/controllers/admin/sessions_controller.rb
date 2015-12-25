class Admin::SessionsController < Admin::ApplicationController
	layout 'admin/login'
  def new
  end

  def create
  	user = User.authenticate(params[:email], params[:password])
  	if user
  		session[:user_id] = user.id 
  		redirect_to admin_posts_path, :notice => "connexion réussie"
  	else
  		flash.now.alert = "email ou mot de passe invalide"
  		render 'new'
  	end
  end
  def destroy
      session[:user_id] = nil
      redirect_to admin_login_path , :notice => "Deconnecté"
  end
end
