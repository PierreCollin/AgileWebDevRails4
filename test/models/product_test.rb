require'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "product attributes must be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "price must be positive" do
    product = Product.new(
        title: "My title is set",
        description: "yyyy",
        image_url: "hello.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(title: "My Book Title",
                description: "yyy",
                price: 1,
                image_url: image_url)
  end

  test "image_url" do
    ok = %w{fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif}
    bad = %w{fred.doc fred.gif/more fred.gif.more}

    ok.each do |name|
        assert new_product(name).valid?, "#{name} should be valid"
    end

    bad.each do |name|
        assert new_product(name).invalid?, "#{name} should be invalid"
    end

  end
  
  test "product is not valid without a unique title" do
    product = Product.new(title:        products(:ruby).title,
                          description:  "yyy",
                          image_url:    "fred.png",
                          price:        3)
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end

  test "product is not valid without a unique title - i18n" do
    product = Product.new(title:        products(:ruby).title,
                          description:  "yyy",
                          price:        1,
                          image_url:    "fred.gif") 
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]

  end

  test "product title is at least ten charaters long" do
    product = Product.new(title:        "1o charaters long or more",
                          description:  "descr",
                          price:        1,
                          image_url:    "img.png")
    assert product.valid?

    product.title = "exactly 10"
    assert product.valid?

    product.title = "too short"
    assert product.invalid?
    assert_equal ["must be at least 10 characters long"], product.errors[:title]


  end

end