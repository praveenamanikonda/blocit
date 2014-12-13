require 'faker'

# Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all

# Note: By calling 'User.new' instead of 'create',
# We create an instance of user which isn't immediately saved to the database.

# The `skip_confirmation!` method sets the `confirmed_at` attribute
# to avoid triggering an confirmation email when the User is saved.

# The `save` method then saves this User to the database.

# Create Posts 
50.times do 
  Post.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
end   
posts = Post.all 

#Create Comments 
100.times do 
  Comment.create!(
    #    user: users.sample,   # we have not yet associated Users with Comments 
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
end   

user = User.first
 user.skip_reconfirmation!
 user.update_attributes!(
   email: 'veena.chaitu2007@gmail.com',
   password: 'helloworld'
 )

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} posts created"
 
