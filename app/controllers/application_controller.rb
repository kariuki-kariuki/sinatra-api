class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'


  def get_messages(attr)
    Message.where(["sender = '%s' and receiver = '%s'", attr[:currentuser], attr[:activechat]]).or(
      Message.where(["sender = '%s' and receiver = '%s'", attr[:activechat], attr[:currentuser]])
    )
  end
  
  # Add your routes here
  def login(attr)
    user = User.where(["phone = '%s' and password = '%s'", attr[:phone], attr[:password]]).first
    if user.password == attr[:password]
      user
    else
      {data: "Error login"}
    end
  end

  def check_if_user_exist?(attr)
    user = User.find_by(attr[:phone])
    if user.phone == attr[:phone]
      true
    else
      false
    end
  end

  def get_contacts(attr)
    contacts = Contact.where("sender = '%s'", attr[:phone])

    new_contact_details = contacts.map do |contact|
      {name: contact.name, phone: contact.receiver, last_message: self.get_messages(currentuser: contact.sender, activechat: contact.receiver).last}
    end
    new_contact_details.to_json
  end

  get "/contacts/:phone" do

    self.get_contacts(phone: params[:phone])

  end

  def self.add_contact(attr)
    if !self.check_if_user_exist?(attr)
      new_contact = User.create(attr)
      new_contact.save

    else
      {}
    end

  end


  #login
  get "/login/:phone/:password" do
    # { message: "Good luck with your project!" }.to_json
    phones = self.login(phone: params[:phone], password: params[:password])
    phones.to_json
  end

  post "/users" do 
    if self.check_if_user_exist?(phone: params[:phone]) 
      res = {respone: "User Exist"}
    else
      new_user = User.create(
        # name: params[:name],
        email: params[:email],
        image: params[:image],
        phone: params[:phone],
        password: params[:password],
        username: params[:username]
      )
      new_user.save
      new_user.to_json
    end
  end

  post "/messages/new" do 
    new_message = Message.create(
      text_massage: params[:text_massage],
      sender: params[:sender],
      receiver: params[:receiver],
      typ: params[:type]
    )
    new_message.save


    msgs = get_messages(currentuser: params[:sender], activechat: params[:receiver])
    msgs.to_json
  end

  post "/businesses" do 
    new_business = Business.create(
      item_name: params[:item_name],
      phone: params[:phone],
      price: params[:price],
      item_id: params[:item_id],
      business_name: params[:business_name],
      image: params[:image],
      description: params[:description]
    )
    new_business.save

  end

  

  get "/messages/?:currentuser/?:activechat" do
    
    msgs = self.get_messages(currentuser: params[:currentuser], activechat: params[:activechat])
    msgs.to_json
  end

  # get "/contacts/?" do

  # end

  get "/balance/:phone" do
    bal = Account.find_by(phone: params[:phone])
    bal.to_json
  end

  patch "/patch" do
    send_to = Account.find_by(phone: params[:receiver])
    send_amount = send_to.balance
    send_to.balance = send_amount + params[:text_massage]
    send_to.save
    send_from = Account.find_by(phone: params[:sender])
    send_amount_to = send_from.balance
    send_from.balance = send_amount_to - params[:text_massage]
    send_from.save
  end

end
