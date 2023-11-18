class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :addresses, :building, :phone_numbe, :user_id, :item_id 

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :addresses
    validates :phone_numbe, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :user_id
    validates :item_id

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id city: city, addresses: addresses, building: building, phone_numbe: phone_numbe,order_id: order.id)
  end
end
