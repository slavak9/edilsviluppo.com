class Work < ApplicationRecord
    has_many :post, dependent: :destroy
    has_one_attached :work_img
    validates :title, presence: true
    validates :work_img, attached: true, content_type: {with: ['image/gif','image/png', 'image/jpeg', 'image/webp','image/avif'], message: I18n.t('.img_error')}
end
