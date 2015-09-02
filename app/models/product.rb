class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01, message: 'must be greater or equal than 0.01' }
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
                with: %r{\.(gif|jpg|png)\Z}i,
                message: 'must be a URL for GIF, JPG or PNG image.' }
  validates :title, length: { in: 5..25 }

  def self.latest
    Product.order(:updated_at).last
  end
end
