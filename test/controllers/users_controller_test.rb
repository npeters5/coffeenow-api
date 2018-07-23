require "test_helper"

describe UsersController do
  describe '#create' do
    # what is my error return format?
    it 'should not signup without password' do
      post users_url,
        params: {
          user: {
            email: "test@test.com",
          }
        }

      user = JSON.parse(response.body)
      # assert_equal(user["errors"]["password"]["can't be blank"])
      # user.must_raise("can't be blank")
    end

    it 'should not signup without email'

    it 'should return the User object if successful' do
      post users_url,
        params: {
          user: {
            email: "test@test.com",
            password: "qwerty"
          }
        }

      user = JSON.parse(response.body)

      assert_not_nil(user['id'])
      assert_not_nil(user['api_token'])
      assert_equal("test@test.com", user['email'])
      assert(!user.has_key?('password'))
    end
  end

  describe '#signin' do
    it 'should allow existing user to sign in'
    it 'should throw error when non-existant user attempts to sign in'
  end
end
