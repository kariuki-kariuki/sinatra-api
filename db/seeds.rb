puts "🌱 Seeding spices..."

# Seed your database here
User.all.delete_all
User.create(username: "Emkay", phone: 742075647, password: "wueh", email: "emkay@gmail.com")
User.create(username: "Sammy Doe", phone: 742075648, password: "wueh", email: "node@gmail.com")
User.create(username: "Wendy", phone: 742, password: "wueh", email: "emkay@gmail.com" )
User.create(username: "John", phone: 743, password: "wueh", email: "emkay@gmail.com")

Message.all.delete_all
Message.create(text_massage: "Hello Emkay", sender: 742, receiver: 742075647, typ: "text")
Message.create(text_massage: "Hello Wendy How are you doing?", sender: 742075647, receiver: 742, typ: "text")
Message.create(text_massage: "I am fine thank I really miss you,  how are you?", sender: 742, receiver: 742075647, typ: "text")
Message.create(text_massage: "I am doing good I miss you too.", sender: 742075647, receiver: 742, typ: "text")
Message.create(text_massage: 'Welcome to chatty you can ask me anything.', sender: 7426, receiver: 742, typ: 'text')

Account.all.delete_all
Account.create(phone: 742075647, balance: 35600)
Account.create(phone: 742, balance: 15600)
Account.create(phone: 743, balance: 10600)
Account.create(phone: 742075648, balance: 2900)

Contact.all.delete_all
Contact.create(sender: 742, receiver: 742075647, name: "Emkay")
Contact.create(sender: 742, receiver: 743, name: "John")
Contact.create(sender: 742, receiver: 742075648,  name:"Sam")

#seeding bots
Contact.create(sender: 7426, receiver: 742,  name:"Wendy")
Contact.create(sender: 742, receiver: 7426,  name:"Chatty Bot")

puts "✅ Done seeding!"
