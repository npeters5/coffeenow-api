class Favorite < ApplicationRecord
  belongs_to :user

  validates :shop_id, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true
end
