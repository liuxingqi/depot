class Comment < ActiveRecord::Base
  belongs_to :product, :dependent => :destroy
  
  attr_accessible :evaluate, :product_id
  
  validates :evaluate, :presence => true

  
end
