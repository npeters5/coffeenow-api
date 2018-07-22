class User < ApplicationRecord

  has_many :favorites

  before_validation :generate_api_token
  validates :api_token, presence: true
  validates :email, presence: true
  validates :password, presence: true

  def as_json(*)
    super.except('password')
  end

  def favorited?(shop)
    favorites
      .detect do |favorite|
        favorite.shop_id == shop.id
      end
      .present?
  end


  private

  def generate_api_token
    self.api_token ||= SecureRandom.hex(64)
  end
end
