class Category < ApplicationRecord
    has_many :product, dependent: :destroy
    has_one_attached :category_img
    validates :title, :description, presence: true
    # validates :category_img, content_type: {with: %r{\.(gif|jpg|png|webp|avif)\z}i,message: I18n.t('.img_error')}
    validates :category_img, attached: true, content_type: {with: ['image/gif','image/png', 'image/jpeg', 'image/webp','image/avif'], message: I18n.t('.img_error')}
end
