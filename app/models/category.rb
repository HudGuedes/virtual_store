class Category < ApplicationRecord
  validates :name, presence: true
  has_many :products
  belongs_to :parent, class_name: 'Category', foreign_key: 'parent_id', optional: true

  scope :parent_categories, -> { where(parent_id: nil) }
  scope :childrens, ->(parent_id) { where(parent_id: parent_id) }

  def name_with_parents
    new_name = name
    unless parent.nil?
      new_name = recursive_name(new_name, parent)
    end
    new_name
  end

   private

  def recursive_name(name, parent)
    unless parent.nil?
      name = "#{parent.name} > #{name}"
      name = recursive_name(name, parent.parent)
    end
    name
  end
end
