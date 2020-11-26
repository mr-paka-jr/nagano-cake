# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'test@test.com',
   password: 'testtest',
)

5.times do |n|
 Customer.create!(
   email: "test#{n + 1}@test.com",
   password: "testtest#{n + 1}",
   last_name: "テスト",
   first_name: "会員#{n + 1}",
   last_name_kana: "テスト",
   first_name_kana: "カイイン#{n + 1}",
   postal_code: "1500041",
   address: "東京都渋谷区神南１丁目１９−１１ パークウェースクエア2 4階",
   telephone_number: "0368694700",
 )
end

 Genre.create!([{name: "ケーキ"}, {name: "和菓子"}, {name: "クッキー"}])


4.times do |n|
 Item.create!(
  [
   {
    genre_id: 1,
    name: "商品#{n + 1}",
    image: File.open("./app/assets/images/ケーキ#{n + 1}.jpg"),
    introduction: "商品#{n + 1}の説明文。" ,
    price: "#{n * 120 + 2500}" }])
end

3.times do |n|
 Item.create!(
  [
   {
    genre_id: 3,
    name: "商品#{n + 5}",
    image: File.open("./app/assets/images/クッキー#{n + 1}.jpg"),
    introduction: "商品#{n + 5}の説明文。" ,
    price: "#{n * 120 + 250}" }])
end