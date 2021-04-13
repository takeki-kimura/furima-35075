class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions  

  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :day

  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :category_id
    validates :price
    validates :user
    validates :status_id
    validates :fee_id
    validates :prefectures_id
    validates :date_id
    validates :description
  end
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :prefecture_id
    validates :date_id
  end
end
