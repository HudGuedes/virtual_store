class Photo < ApplicationRecord
   validates :name, :path, presence: true
   belongs_to :product
end