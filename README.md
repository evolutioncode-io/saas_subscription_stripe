# README

https://subscriptions-rails-stripe.herokuapp.com/   < Live App

rails new saas_subscription_stripe -d=postgresql
cd saas_subscription_stripe
git init
gaa .
gcmsg 'initial commit'
rake db:create
rake db:migrate
--- Create the github repository
git remote add origin https://github.com/evolutioncode-io/saas_subscription_stripe.git
git branch -M main
git push -u origin main
---
rails g migration add_sales_count_to_products
rails db:migrate
bundle lock --add-platform ruby  
bundle lock --add-platform x86_64-linux  
bundle
gaa. gcmsg
heroku create
heroku config:set RAILS_MASTER_KEY=`cat config/master.key`
git push heroku main
heroku run rails db:migrate
heroku run rake db:seed
---
rails g scaffold Post title content:text premium:boolean --no-helper no--controller-specs --no-view-specs --no-test-framework --no-jbuilder
rails db:migrate
---
rails db:seed
rails generate devise:install
rails generate devise User
---
rails g migration add_stripe_customer_id_to_users stripe_customer_id:string

rails c:   Stripe::Product.create(name: 'Good')
rails c:   Stripe::Price.create(product: "prod_KFwTGUzbN68nyR", recurring: {interval: 'month'}, currency: 'usd', unit_amount: 1000)
rails c:   Stripe::Price.create(product: "prod_KFwTGUzbN68nyR", recurring: {interval: 'year'}, currency: 'usd', unit_amount: 10000)

rails c:   Stripe::Price.update("price_1JbQeQI2rsCLxTB1zVxsEzJD", lookup_key: "good_year")
           Stripe::Price.update("price_1JbQd2I2rsCLxTB1XUHwT9uE", lookup_key: "good_month")
