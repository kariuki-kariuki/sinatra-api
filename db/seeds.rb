puts "🌱 Seeding spices..."

# Seed your database here
User.create(username: "Emkay", phone: 742075647, password: "wueh", email: "emkay@gmail.com", image: "'https://d346xxcyottdqx.cloudfront.net/wp-content/uploads/2016/04/Digital-696x371.jpg")
User.create(username: "Sammy Doe", phone: 742075648, password: "wueh", email: "node@gmail.com", image: "https://d346xxcyottdqx.cloudfront.net/wp-content/uploads/2016/04/Digital-696x371.jpg")
User.create(username: "Wendy", phone: 742, password: "wueh", email: "emkay@gmail.com", image: "https://d346xxcyottdqx.cloudfront.net/wp-content/uploads/2016/04/Digital-696x371.jpg")
User.create(username: "John", phone: 743, password: "wueh", email: "emkay@gmail.com", image: "https://d346xxcyottdqx.cloudfront.net/wp-content/uploads/2016/04/Digital-696x371.jpg")

Message.create(text_massage: "Hello Emkay", sender: 742, receiver: 742075647, typ: "text")
Message.create(text_massage: "Hello Wendy How are you doing?", sender: 742075647, receiver: 742, typ: "text")
Message.create(text_massage: "I am fine thank I really miss you,  how are you?", sender: 742, receiver: 742075647, typ: "text")
Message.create(text_massage: "I am doing good I miss you too.", sender: 742075647, receiver: 742, typ: "text")

Account.create(phone: 742075647, balance: 35600)
Account.create(phone: 742, balance: 15600)
Account.create(phone: 743, balance: 10600)
Account.create(phone: 742075648, balance: 2900)

Contact.create(sender: 742, receiver: 742075647, name: "Emkay")
Contact.create(sender: 742, receiver: 743, name: "John")
Contact.create(sender: 742, receiver: 742075648,  name:"Sam")

puts "✅ Done seeding!"
