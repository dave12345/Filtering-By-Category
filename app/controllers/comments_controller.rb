class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.create(comment_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @comment = Comment.find(params[:id]).destroy
    redirect_to product_path(@product)
  end

  private
  
    def comment_params
      params.require(:comment).permit(:comment, :product_id)
    end
end
