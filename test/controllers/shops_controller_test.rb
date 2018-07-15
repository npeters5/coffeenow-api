require "test_helper"

describe ShopsController do
  it "should get index" do
    get shops_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get shops_show_url
    value(response).must_be :success?
  end

end
