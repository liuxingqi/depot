class StoreController < ApplicationController
	
  def index
  	@products=Product.all
  	@counter=view_counter
  end
end
