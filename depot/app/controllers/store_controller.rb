class StoreController < ApplicationController
   skip_before_filter :authorize
	
  def index
   #  @stores =Product.all
  	# @stores.paginate :page=>params[:search], :order=>'created_at desc',
   #                               :conditions => ['name like ?', '%#{params[:search]}%'], :order => 'title',
   #                               :per_page => 5
  	# @products=Product.all
    @stores = Product.search(params[:search], params[:page])
  	@counter=view_counter
  	@cart=current_cart

  end
end
