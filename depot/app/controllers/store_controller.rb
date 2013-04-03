class StoreController < ApplicationController
	
  def index
  	@products=Product.all
  	@counter=view_counter
  	@cart=current_cart
  end
end
