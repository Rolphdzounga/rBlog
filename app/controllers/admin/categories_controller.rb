class Admin::CategoriesController < Admin::ApplicationController
  before_filter :verify_logged_in
  before_action :set_category , [:edit , :update , :show , :destroy ]

  def new
    @category = Category.new  
    
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Catégorie créee'
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    
    if @category.update(category_params)
      flash[:notice] = 'Mise à Réussie'
      redirect_to admin_categories_path
    else
      
      render 'new'
    end
  end

  def destroy
    
    @category.destroy
    flash[:notice] = 'Supression Réussie'
      redirect_to admin_categories_path
  end

  def index
    if params[:search]
      @categories = Category.search(params[:search]).all.order('created_at desc').paginate(:per_page => 2, :page => params[:page]) 
    else
      @categories = Category.all.order('created_at desc').paginate(:per_page => 2, :page => params[:page])
    end

  end

  def show
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end

end
