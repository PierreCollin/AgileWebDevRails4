# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  image_url   :string(255)
#  price       :decimal(8, 2)
#  created_at  :datetime
#  updated_at  :datetime
#

class Product < ActiveRecord::Base
  # Validations
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {
    greater_than_or_equal_to: 0.01,
    less_than: 1000
  }
  validates :title, uniqueness: true
  validates :title, length: {
    minimum: 10,
    too_short: "must be at least %{count} characters long"
  }
  validates :image_url, uniqueness: {value: true, message: "image url must be unique"}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be an URL for GIF, JPG or PNG image.'
  }

  # ActiveRecord associations
  has_many :line_items
  has_many :orders, through: :line_items

  # ActiveRecord callback methods
  before_destroy :ensure_not_referenced_by_any_line_item

  def self.lastest
    Product.order(:updated_at).last
  end

  private
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'line Items present')
        return false
      end
    end
end
