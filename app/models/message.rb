class Message < ActiveRecord::Base
  belongs_to :contact
  has_many :users, through: :contact
end