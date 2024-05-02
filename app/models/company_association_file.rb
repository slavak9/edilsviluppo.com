class CompanyAssociationFile < ApplicationRecord
    has_one_attached :company_img
    has_one_attached :pdf
    validates :description, presence: true
    validates :company_img, attached: false, content_type: {with: ['image/gif','image/png', 'image/jpeg', 'image/webp','image/avif'], message: I18n.t('.img_error')}
    validates :pdf, attached: false, content_type: {in: 'application/pdf', message: "files only"}
end
