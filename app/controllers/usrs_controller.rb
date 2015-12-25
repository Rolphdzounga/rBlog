class UsrsController < ApplicationController
  before_action :set_user, only: [:show,:edit,:update]
  before_action :require_user ,except: [:show,:index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @users = Usr.all
  end

  def show
    
  end

  def new
    @user = Usr.new
  end

  def create
    @user = Usr.new(user_params)

    if @user.save
      flash[:notice] = "Bienvenu à rB.com, #{@user.username}..."
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    

    if @user.update(user_params)
      flash[:notice] = "Mise à jour Réussie..."
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
  end
  private
    def user_params
      params.require(:usr).permit(:username,:email,:password)
    end

    def set_user
      @user = Usr.find(params[:id])
    end

    def require_same_user
     if current_user != @user
        flash[:alert] = "Vous n'etes pas autorisé à effectuer cette opération..." 
        redirect_to root_path
     end
    end
end
