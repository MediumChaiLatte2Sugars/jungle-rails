require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it 'verifies a user is created a with matching password and password_confirmation fields' do
      @user = User.create({
        first_name: 'John',
        last_name: 'Doe',
        email: 'johndoe@example.com',
        password: 'password',
        password_confirmation: 'word'
      })

      @user.valid?

      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      
    end

    it 'verifies the presence of email' do
      @user = User.create({
        first_name: 'John',
        last_name: 'Doe',
        email: nil,
        password: 'password',
        password_confirmation: 'password'
      })

      @user.valid?

      expect(@user.errors[:email]).to include("can't be blank")
    end

    it 'verifies the uniqueness of emails (case insensitive)' do
      @user = User.create({
        first_name: 'John',
        last_name: 'Doe',
        email: 'email@email.com',
        password: 'password',
        password_confirmation: 'password'
      })

      @user2 = User.create({
        first_name: 'John',
        last_name: 'Doe',
        email: @user.email.upcase,
        password: 'password',
        password_confirmation: 'password'
      })

      @user2.valid?

      expect(@user2.errors[:email]).to include("has already been taken")
    end

    it 'verifies the presence of a first name' do
      @user = User.create({
        first_name: nil,
        last_name: 'Doe',
        email: 'email@email.com',
        password: 'password',
        password_confirmation: 'password'
      })

      @user.valid?
      
      expect(@user.errors[:first_name]).to include("can't be blank")
    end

    it 'verifies the presence of a last name' do
      @user = User.create({
        first_name: 'John',
        last_name: nil,
        email: 'email@email.com',
        password: 'password',
        password_confirmation: 'password'
      })

      @user.valid?
      
      expect(@user.errors[:last_name]).to include("can't be blank")
    end
  end
end
