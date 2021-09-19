class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   def to_s
     email
   end

  # Se le agrega al usuario el id dentro de Stripe
   after_create do
     customer = Stripe::Customer.create(email: self.email)
     update(stripe_customer_id: customer.id)
   end
end
