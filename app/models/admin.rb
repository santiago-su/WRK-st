class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :transactions

  def balance
    total = 0
    x = 0
    y = 0
    ingr = Transaction.where(type_of_transaction: "1")
    egre = Transaction.where(type_of_transaction: "2")
    ingr.each { |a| x += a.amount }
    egre.each { |b| y += b.amount }
    total = x - y
  end
  
end
