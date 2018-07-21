class Favorite < ApplicationRecord
  belongs_to :user

  validates :shop_id, presence: true
  validates :user_id, presence: true
end
