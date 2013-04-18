class StoreController < ApplicationController
   # skip_before_filter :authorize, :only => [:create, :update, :destroy]
	
  def index
  	@stores = Product.paginate :page=>params[:store], :order=>'created_at desc',
                                 # :conditions => ['name like ?', '%#{params[:search]}%'], :order => 'title',
                                 :per_page => 5
  	# @products=Product.all
  	@counter=view_counter
  	@cart=current_cart
  end
end
