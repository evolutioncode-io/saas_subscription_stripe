class StaticPagesController < ApplicationController

  def pricing
    # para poder sacar los precios de producto/precio especifico se genera un lookup_key en Rails c:  Stripe::Price.update("price_1JbQeQI2rsCLxTB1zVxsEzJD", lookup_key: "good_year")
    @pricing = Stripe::Price.list(lookup_keys: ["good_year", "good_month"], expand: ["data.product"]).data.sort_by {|p| p.unit_amount}
  end

end
