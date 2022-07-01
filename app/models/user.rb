class User < ActiveRecord::Base
  has_many :messages
  has_many :contacts, through: :messages
end