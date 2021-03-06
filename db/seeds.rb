# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jason = User.create!(name:'Jason', email:'wp.jason@example.com', password: 'password',
            password_confirmation: 'password', confirmed_at: Time.now)

beatriz = User.create!(name:'Beatriz', email:'beatrizgarciasuarez@example.com',
            password: 'password', password_confirmation: 'password',
            confirmed_at: Time.now)

jason2 = User.create!(name:'Jason2', email: 'jttmckee@example.com', password:'password',
            password_confirmation: 'password', confirmed_at: Time.now)

hodja = User.create!(name:'Hodja', email: 'hodja@example.com', password:'password',
            password_confirmation: 'password', confirmed_at: Time.now)

kirk = User.create!(name:'Kirk', email: 'kirk@example.com', password: 'password',
            password_confirmation: 'password', confirmed_at: Time.now)

45.times do |i|
  first_name = Faker::Name.first_name
  name = first_name + Faker::Name.last_name
  email = "#{first_name}#{i}@example.com"
  User.create!(name: name, email: email, password: 'password',
    password_confirmation: 'password', confirmed_at: Time.now)
end

jason.friends << beatriz

jason.friends << hodja

kirk.friends << jason

User.all.each do |user|
  jason2.friends << user
end

21.times do
  User.all.each do |user|
    user.posts.create!(body: Faker::Lorem.paragraph(4,false,15))
  end
end

5.times do
  Post.all.each do |post|
    commentator = post.author.friends.order("RANDOM()").first
    post.comments.create!(body: Faker::Lorem.sentence, author_id: commentator.id)
  end
end
