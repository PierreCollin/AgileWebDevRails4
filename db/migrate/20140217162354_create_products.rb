class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
    p = Product.new
    p.title = 'my Title is long'
    p.description = 'A description'
    p.image_url = 'ruby.jpg'
    p.price = 24.5
    p.save!
  end
end
