class StaticPagesController < ApplicationController

  def pricing
    # para poder sacar los precios de producto/precio especifico se genera un lookup_key en Rails c:  Stripe::Price.update("price_1JbQeQI2rsCLxTB1zVxsEzJD", lookup_key: "good_year")
    # @pricing = Stripe::Price.list(lookup_keys: ["rp_basic_3800_m", "rp_basic_29900_y", "rp_team_9900_m", "rp_team_74400_y", "rp_enter_19900_m", "rp_enter_150000_y" ], expand: ["data.product"]).data.sort_by {|p| p.unit_amount}

    @pricing_basic = Stripe::Price.list(lookup_keys: ["rp_basic_3800_m", "rp_basic_29900_y"], expand: ["data.product"]).data.sort_by {|p| p.unit_amount}

    @pricing_team = Stripe::Price.list(lookup_keys: ["rp_team_9900_m", "rp_team_74400_y"]).data.sort_by {|p| p.unit_amount}

    @pricing_enter = Stripe::Price.list(lookup_keys: ["rp_enter_19900_m", "rp_enter_150000_y" ], expand: ["data.product"]).data.sort_by {|p| p.unit_amount}



    if current_user.stripe_customer_id
        # <%= link_to t('learn_more'), "https://connect.stripe.com/oauth/authorize?response_type=code&client_id=ca_32D88BD1qLklliziD7gYQvctJIhWBSQ7&scope=read_write", class: "btn btn-primary" %>
    else
        # customer = Stripe::Customer.create(email: self.email, name: self.fullname)
        # update customer Stripe ID
    end


  end

end
