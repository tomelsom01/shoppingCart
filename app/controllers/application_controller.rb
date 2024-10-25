class ApplicationController < ActionController::Base
  helper_method :current_cart  # Make it available to views if needed

  private
  
  def current_cart
    if current_user
      @current_cart ||= current_user.cart || current_user.create_cart
    else
      @current_cart ||= Cart.find(session[:cart_id]) if session[:cart_id]
      if @current_cart.nil?
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    end
  end
end
