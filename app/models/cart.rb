class Cart < ApplicationRecord
  has_many :cart_items
  belongs_to :user, optional: true

  def add_product(product)
    current_item = cart_items.find_by(product_id: product.id)
    if current_item
      current_item.increment(:quantity)
    else
      cart_items.create(product_id: product.id, quantity: 1)
    end
  end

  def remove_product(product)
    current_item = cart_items.find_by(product_id: product.id)
    current_item.destroy if current_item
  end
end
