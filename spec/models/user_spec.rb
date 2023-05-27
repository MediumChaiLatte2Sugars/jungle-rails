require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it 'verifies a user is created a with matching password and password_confirmation fields' do
      pending 'in progress'
    end

    it 'verifies the presence of email' do
      pending 'in progress'
    end

    it 'verifies the uniqueness of emails (case insensitive)' do
      pending 'in progress'
    end

    it 'verifies the presence of a first name' do
      pending 'in progress'
    end

    it 'verifies the presence of a last name' do
      pending 'in progress'
    end
  end
end
