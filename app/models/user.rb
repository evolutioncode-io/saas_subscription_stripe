class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :fullname, presence: true

   def to_s
     email
   end

  # Se le agrega al usuario el id dentro de Stripe
   after_create do
     customer = Stripe::Customer.create(email: self.email, name: self.fullname)
     # update(stripe_customer_id: customer.id)  >> se movio a webhooks
   end
end
