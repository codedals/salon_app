class Product < ApplicationRecord
  belongs_to :salon
  validates_presence_of :name, :price

  PREVIEW_LIST_LIMIT = 5

end
