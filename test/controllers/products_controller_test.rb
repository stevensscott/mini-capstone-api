require "test_helper"
#Test in this file use the test DB, not persisted to Dev DB. Used for UNIT testing.
class ProductsControllerTest < ActionDispatch::IntegrationTest
  #gets all products from products table and asserts product count from DB matches what we pull from the api

  setup do
    # creating an admin user
    @user = User.create(name: "Test", email: "test@test.com", password: "password", admin: true)

    # creating a session
    post "/sessions.json", params: { email: "test@test.com", password: "password" }

    # saving jwt to instance variable
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end



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
      post "/products.json", 
      headers: { "Authorization" => "Bearer #{@jwt}" },
      params: { name: "test", price: 10,  description: "test description" , supplier_id: Supplier.first.id}
      assert_response 200
    end

    post "/products.json",
    headers: { "Authorization" => "Bearer #{@jwt}" },
    params: {}
    assert_response 422

      # testing unauthorize user
    post "/products.json"
    assert_response 401
  end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json",
    headers: { "Authorization" => "Bearer #{@jwt}" }, 
    params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    assert_equal product.price, data["price"].to_i    
    assert_equal product.description, data["description"]

    patch "/products/#{product.id}.json",
    headers: { "Authorization" => "Bearer #{@jwt}" },
    params: { name: "" }
    assert_response 422

     # testing unauthorized user
    patch "/products/#{product.id}.json"
    assert_response 401


  end

  test "destroy" do
    # testing successful destroy action
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json", 
      headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end

    # testing unauthorized user
    delete "/products/#{Product.first.id}.json"
    assert_response 401
  end

end


