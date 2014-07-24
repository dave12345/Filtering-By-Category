class ProductsController < ApplicationController
before_action :set_product, only:[:show, :edit, :update, :destroy]

  def index
    if params[:category_id]
      @products = Product.where(category_id: params[:category_id])
    else
      @products = Product.all
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      # flash[:notice] = "New product successfully created"
      redirect_to root_path
    else
      render :new
      # flash[:notice] = "Error"
    end
  end


  def show
    @comment = Comment.new
    @comments = @product.comments
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to root_path
  end

  def destroy
    
    @product.destroy
    redirect_to root_url
  end

  private

    def product_params
        params.require(:product).permit(:name, :description, :pricing, :category_id, :product_id)
      end

    def set_product
      @product = Product.find(params[:id])
    end

end
