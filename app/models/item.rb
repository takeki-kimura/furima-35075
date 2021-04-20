class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions  

  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :prefectures
  belongs_to :day

  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :category_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }
    validates :status_id
    validates :fee_id
    validates :prefectures_id
    validates :day_id
    validates :description
    validates :image
  end
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :prefectures_id
    validates :day_id
  end

  def was_attached?
    self.image.attached?
  end
end
