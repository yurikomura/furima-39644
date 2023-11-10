class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
              

   #空の投稿を保存できないようにする
   with_options presence: true do
     validates :name
     validates :image
     validates :info
     validates :category_id
     validates :sales_status_id
     validates :shipping_fee_status_id
     validates :prefecture_id
     validates :scheduled_delivery_id
     validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 10_000_000 }    
   end

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :sales_status_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :shipping_fee_status_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :scheduled_delivery_id, numericality: { other_than: 0 , message: "can't be blank"}
            
  belongs_to :user
  has_one :order
  has_one_attached :image

end

