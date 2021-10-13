class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:stripe_connect]

  validates :fullname, presence: true

   def to_s
     email
   end

  # Se le agrega al usuario el id dentro de Stripe
   after_create do
     customer = Stripe::Customer.create(email: self.email, name: self.fullname)
     # update(stripe_customer_id: customer.id)  >> se movio a webhooks
   end

   def can_receive_payments?
    uid? &&  provider? && access_code? && publishable_key?
  end
end
