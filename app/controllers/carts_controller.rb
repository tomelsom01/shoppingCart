class CartsController < ApplicationController
  def add_item
    @cart = current_cart
    product = Product.find(params[:product_id])
    @cart.add_product(product)
    redirect_to cart_path
  end

  def remove_item
    @cart = current_cart
    product = Product.find(params[:product_id])
    @cart.remove_product(product)
    redirect_to cart_path
  end

  def show
    @cart = current_cart
  end
end
