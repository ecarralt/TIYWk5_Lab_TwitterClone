require 'faker'

User.delete_all
# User.create! username: "ecarralt", password: "12345678", first_name: "Enrique", last_name: "Carral", photo_tag: "ecarralt.jpg" , blurb: "This is where I put my thoughts"

user_info = [
  {first_name: "Enrique", last_name: "Carral", password: "12345678", username: "ecarralt", photo_tag: "ecarralt.jpg"},
  {first_name: "Geroge", last_name: "Orwell", password: "12345678", username: "orwell", photo_tag: "http://cdn8.openculture.com/wp-content/uploads/2014/11/George-Orwell-001.jpg" },
  {first_name: "Aldous", last_name: "Huxley", password: "12345678", username: "huxley", photo_tag: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSwlRVR62OKbHiKr9YTGPoJnO1nyKTfQ_8sy5cDJaaIFrxdylG3vg"},
  {first_name: "Ken", last_name: "Kesey", password: "12345678", username: "kesey", photo_tag: "https://www.erowid.org/culture/characters/kesey_ken/images/kesey_ken1_med.jpg"},
  {first_name: "Anthony", last_name: "Burgees", password: "12345678", username: "burgees", photo_tag: "https://gradesaver.s3.amazonaws.com/uploads/section/34c40a8f-7985-4cc4-bce1-10a2f2f33d45/image/1414477095.jpeg"}
]

user_info.each do |name|
  user = User.new
  user.first_name = name[:first_name]
  user.last_name = name[:last_name]
  user.username = name[:username]
  user.password = name[:password]
  user.photo_tag = name[:photo_tag]
  if user.save
    puts "Created user: #{user}"
  else
    puts "DID NOT CREATE user: #{user}"
  end

end

5.times do |fakeuser|
  fakeuser = User.create! username: Faker::Internet.user_name, password: "12345678", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, photo_tag: Faker::Avatar.image
  if fakeuser.id
    puts "created user #{fakeuser.username}"
  else
    puts "did not create user desired"
  end
end


Thought.delete_all

thought_bodies = [

  "Honest disagreement is often a good sign of progress. - Mahatma Gandhi",
  ".@RachelRileyRR’s jam-packed day at #makethefuture London. Why not have your own tomorrow? http://go.shell.com/294RxoG",
  "How a satellite phone company survived bankruptcy to generate annual revenues of over $400m http://econ.st/2955iTI",
  "Amal Clooney: I'm from a family of #refugees http://wef.ch/29aQ7dM  @YGLvoices",
  "A person who feels that they’ve been heard will relax, let their guard down.",
  "OMG also how much moneys and where do I sign",
  "Learning to Code: New Possibilities Through Collaboration at School: http://bit.ly/28QdtTn  #edtech #ntchat",
  "Home away from home",
  "In 2015, #fintech generated £6.6bn in revenue. We spent a weekend exploring how it’s shaping the financial sector http://ow.ly/OWn8301Q0Gi",
  "In his last Banyan column, @simonlong55 explains why he is optimistic about Asia's future http://econ.st/297zgbW"

]

thought_bodies.each do |thoughtbody|
  newthought = Thought.new
  newthought.body =  thoughtbody
  newthought.user_id = User.all.sample.id
  if newthought.save
    puts "Created thought: #{newthought}"
  else
    puts "DID NOT CREATE thought: #{newthought}"
  end

end

5.times do |fakethought|
  fakethought = Thought.create! user_id: User.all.sample.id, body: Faker::Lorem.paragraph
  if fakethought.id
    puts "created thought #{fakethought.id}"
  else
    puts "did not create thought desired"
  end
end
