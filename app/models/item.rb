class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :preparation_day

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      format: { with: /\A[0-9]+\z/ }
  with_options presence: true do
    validates :price
    validates :title
    validates :text
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :prefecture_id
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :preparation_day_id
  end
end
