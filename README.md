# Jungle

Jungle is a mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.


## Screenshots


### Home Page

The home page consists of a large banner, navigation bar and list of products.

![Screenshot](https://raw.githubusercontent.com/michaelwangcode/jungle-rails/8b04036b13e55369509cfe1135581c95f14fbdbb/assets/Home.png)


### Shopping Cart

Users can add items to their shopping cart and check out using a credit card.
When the shopping cart is empty, a message is displayed.

![Screenshot](https://raw.githubusercontent.com/michaelwangcode/jungle-rails/8b04036b13e55369509cfe1135581c95f14fbdbb/assets/ShoppingCart.png)


### Sign Up

Users can sign up for an account.
The app checks to make sure the email is unique and the password is 8 or more characters.

![Screenshot](https://raw.githubusercontent.com/michaelwangcode/jungle-rails/8b04036b13e55369509cfe1135581c95f14fbdbb/assets/SignUp.png)


### Admin: Product List

Admins have the ability to add and remove products, as well as categories.

![Screenshot](https://raw.githubusercontent.com/michaelwangcode/jungle-rails/8b04036b13e55369509cfe1135581c95f14fbdbb/assets/AllProducts.png)


### Admin: Add New Product

New products can be added from this form in the Admin section.

![Screenshot](https://raw.githubusercontent.com/michaelwangcode/jungle-rails/8b04036b13e55369509cfe1135581c95f14fbdbb/assets/NewProduct.png)




## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
- RSpec
- Bcrypt