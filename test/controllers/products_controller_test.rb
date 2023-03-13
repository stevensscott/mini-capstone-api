require "test_helper"
#Test in this file use the test DB, not persisted to Dev DB. Used for UNIT testing.
class ProductsControllerTest < ActionDispatch::IntegrationTest
  #gets all products from products table and asserts product count from DB matches what we pull from the api
  test "index" do
    
    get "/products.json"
    assert_response 200
  
    data = JSON.parse(response.body)    
    assert_equal Product.count, data.length
  end
  #test validates that we can pull a specific item from db
  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200
  
    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "description", "created_at", "updated_at","inventory_count","supplier_id", "supplier","images"], data.keys
    assert_equal "MyString2", data["name"] #asserts the name of the first product in DB is MyString3
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: { name: "test", price: 10,  description: "test description" , supplier_id: 2}
      assert_response 200
    end

    post "/products.json", params: {}
    assert_response 422
  end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    assert_equal product.price, data["price"].to_i    
    assert_equal product.description, data["description"]

    patch "/products/#{product.id}.json", params: { name: "" }
    assert_response 422
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  end

end


