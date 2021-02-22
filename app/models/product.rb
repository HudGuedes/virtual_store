class Product < ApplicationRecord
  validates :name, :price, presence: true

  belongs_to :category
  has_many :photos

  scope :home_products, -> { where(home: true).limit(10).order('RAND()') }
  scope :from_categories, ->(categories_id) { where(category_id: categories_id) }
  scope :search_from_term, ->(term){
    joins(:category).where("products.name LIKE :term OR description LIKE :term OR categories.name LIKE :term", term: "%#{term}%")
  }

  def home_product?
    home
  end

  def has_discount?
    price_discount.present?
  end
end