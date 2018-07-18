require "test_helper"

describe UsersController do
  describe '#create' do
    # what is my error return format?
    it 'should not signup without password'
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
end
