class Favorite < ApplicationRecord
  belongs_to :user

  validates :shop_id, presence: true, uniqueness: true
  validates :user_id, presence: true
end
