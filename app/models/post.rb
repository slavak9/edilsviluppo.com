class Post < ApplicationRecord
    belongs_to :work
    has_one_attached :post_img
    validates :description, :work_id , :post_img, presence: true
    validates :post_img, attached: true, content_type: {with: ['image/gif','image/png', 'image/jpeg', 'image/webp','image/avif'], message: I18n.t('.img_error')}
end
