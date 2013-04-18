class Product < ActiveRecord::Base
	default_scope :order => 'price'
    has_many :comments
    has_many :line_items
    has_many :orders, :through => :line_items
    before_destroy :ensure_not_referenced_by_any_line_item

  attr_accessible :description, :image_url, :price, :title
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
            :with => %r{\.(gif|jpg|png)$}i,
            :message => 'must be a URL for GIF, JPG or PNG image.'
  }
  
  def self.search(search, page)
  paginate :per_page => 5, :page => page,
           :conditions => ['title like ?', "%#{search}%"],
           :order => 'title'
  end
  private
# ensure that there are no line items referencing this product
def ensure_not_referenced_by_any_line_item
	if line_items.empty?
	return true
	else
	errors.add(:base, 'Line Items present')
	return false
	end
end

end 
