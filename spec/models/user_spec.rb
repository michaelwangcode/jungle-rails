require 'rails_helper'
# run tests with command: bin/rspec


RSpec.describe Product, type: :model do
  describe 'Validations' do

    # Create a valid user
    it "creates valid user" do
      @user = User.new(name: "Bob", last_name: "Smith", email:"bobsmith@mail.com", password:"password", password_confirmation:"password")
      @user.save
      expect(@user).to be_valid
    end


    # Password and password validation must be same
    it "password and password validations must be the same" do
      @user = User.new(name: "Bob", last_name: "Smith", email:"bobsmith@mail.com", password:"password", password_confirmation:"Password")
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    # Email must be unique
    it "email must be unique" do
      @user = User.new(name: "Bob", last_name: "Smith", email:"bobsmith@mail.com", password:"password", password_confirmation:"password")
      @user.save

      @user2 = User.new(name: "Bob", last_name: "Smith", email:"bobsmith@mail.com", password:"password", password_confirmation:"password")
      @user2.save

      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    # Password required
    it "password is required" do
      @user = User.new(name: "Bob", last_name: "Smith", email:"bobsmith@mail.com", password: nil, password_confirmation:"password")
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    # Password confirmation required
    it "password confirmation is required" do
      @user = User.new(name: "Bob", last_name: "Smith", email:"bobsmith@mail.com", password: "password", password_confirmation: nil)
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    # Email required
    it "email is required" do
      @user = User.new(name: "Bob", last_name: "Smith", email: nil, password: "password", password_confirmation: "password")
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    # Name required
    it "Name is required" do
      @user = User.new(name: nil, last_name: "Smith", email:"bobsmith@mail.com", password: "password", password_confirmation: "password")
      @user.save
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    # Last Name required
    it "Last name is required" do
      @user = User.new(name: "Bob", last_name: nil, email:"bobsmith@mail.com", password: "password", password_confirmation: "password")
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    # Minimum password length
    it "password must be greater than 8 characters" do
      @user = User.new(name: "Bob", last_name: nil, email:"bobsmith@mail.com", password: "pass", password_confirmation: "pass")
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end

  end
end