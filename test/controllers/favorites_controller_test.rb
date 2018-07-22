require "test_helper"

describe FavoritesController do
  describe 'create' do
    describe 'signed in' do
      let :user do
        User.create(email: "email.com", password: "test")
      end

      it 'creates new favorite' do
        post favorites_url,
          headers: { 'X-Api-Token' => user.api_token },
          params: {
            favorite: {
              shop_id: "FVzl8rDPiTWEtrNEuCu-Xg",
            }
          }

        favorite = JSON.parse(response.body)

        assert_equal('200', response.code)
        assert_equal("FVzl8rDPiTWEtrNEuCu-Xg", favorite['shop_id'])

      end

      it 'does not create new favorite if shop id is nil' do
        post favorites_url,
          headers: { 'X-Api-Token' => user.api_token },
          params: {
            favorite: {
              shop_id: nil,
            }
          }

        errors = JSON.parse(response.body)

        assert_equal('400', response.code)
        assert errors["errors"].size > 0
        assert_equal(0, Favorite.count)
      end
    end

  end
end
