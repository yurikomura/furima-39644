class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :addresses
    # validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    # validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'should be 10 to 11 digits' }
    validates :phone_number, length: { minimum: 10, maximum: 11 },
                             format: { with: /\A\d{10,11}\z/, message: 'should be 10 to 11 digits' }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(post_code:, prefecture_id:, city:, addresses:, building:,
                   phone_number:, order_id: order.id)
  end
end
