class Admin::PostsController < Admin::ApplicationController
  before_filter :verify_logged_in
  before_action :current_user
  before_action :set_post , only: [:edit , :update , :show , :destroy ]
  before_action :require_user ,except: [:show,:index]
  before_action :require_same_user, only: [:edit, :update, :destroy]





  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if params[:post][:image].blank?
        @post.image = nil
    end

    if @post.save
      flash[:notice] = 'Post crée'
      redirect_to admin_posts_path
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    

    if params[:post][:image].blank?
        @post.image = nil
    end
    
    if @post.update(post_params)
      flash[:notice] = 'Mise à Réussie'
      redirect_to admin_posts_path
    else
      render 'new'
    end
  end

  def destroy
    
    @post.destroy
    flash[:notice] = 'Supression Réussie'
      redirect_to admin_posts_path
  end

  def index
    if params[:search]
      @posts = Post.search(params[:search]).all.order('created_at desc').paginate(:per_page => 2, :page => params[:page]) 
    else
      @posts = Post.all.order('created_at desc').paginate(:per_page => 2, :page => params[:page]) 
    end
  end

  def show
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end
    def post_params
      params.require(:post).permit(:title,:category_id,:user_id,:tags,:image,:body)
    end

    def require_same_user
     if (current_user != @post.usr)
        flash[:alert] = "Vous n'etes pas autorisé à effectuer cette opération..." 
        redirect_to root_path
     end
    end
end
