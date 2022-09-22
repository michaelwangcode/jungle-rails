class Admin::DashboardController < ApplicationController

  # Add basic authentication for the Admin: Dashboard Page
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']


  def show

    @product_total = Product.count(:all)
    @category_total = Category.count(:all)

  end
end
