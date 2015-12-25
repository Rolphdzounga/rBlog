class SessionsController < ApplicationController
	layout 'admin/login'
  def new
  end

  def create
  	 user = Usr.find_by(email: params[:session][:email].downcase)
  	 if user && user.authenticate(params[:session][:password])
  	 	session[:user_id] = user.id
  	 	
  	 	flash[:notice] = 'Bienvenu sur rBlog'
  	 	redirect_to usr_path(user)
  	 else
  	 	flash.now[:alert] = 'Login ou mot de passe incorrecte'
  	 	render 'new'
  	 end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:notice] = "Vous vous etes deconnecter..."
  	redirect_to root_path
  end
end
