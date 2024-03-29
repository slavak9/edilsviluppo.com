class Product < ApplicationRecord
    belongs_to :category
    has_one_attached :product_img
    validates :description, :category_id , :product_img, presence: true
    validates :product_img, attached: true, content_type: {with: ['image/gif','image/png', 'image/jpeg', 'image/webp','image/avif'], message: I18n.t('.img_error')}
end
