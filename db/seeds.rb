# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


30.times do |n|
  User.create(name: "ユーザ#{n}",
    email: "m#{n}@gmail.com", password: "password#{n}",
    password_confirmation: "password#{n}",introduction: "ユーザ#{n}だぽよ",
    profile_image_id: "km224283863211114218347.png")
end

30.times do |n|
  Post.create(user_id: "#{n}".to_i,
    content: "かわゆす。by ショコタン。その#{n}",image_id: "https://www.pakutaso.com/shared/img/thumb/HIRA85_udewonaperopero_TP_V.jpg",
    )
end

30.times do |n|
  Comment.create(user_id: "#{n}".to_i,
    post_id: "#{n}".to_i,comment: "コメントするよ。その#{n}")
end

30.times do |n|
  Nice.create(user_id: "#{n}".to_i,post_id: "#{n}".to_i)
end
