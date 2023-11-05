class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
              

   #空の投稿を保存できないようにする
   validates :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sales_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
            
  with_options presence: true do
    validates :name
    validates :info
    validates :price
  end
  


  belongs_to :user
  has_one :order
  has_one_attached :image
end

