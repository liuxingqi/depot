class StoreController < ApplicationController
	skip_before_filter :authorize, :only => [:create, :update, :destroy]
	
  def index
  	@products=Product.all
  	@counter=view_counter
  	@cart=current_cart
  end
end
