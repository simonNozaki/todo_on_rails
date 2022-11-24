require 'rails_helper'

RSpec.describe 'UserId' do
  it 'should raise ObjectValidationError(blank)' do
    expect { Users::Types::UserId.new('') }.to raise_error Exceptions::ObjectValidationError
  end

  it 'should create a UserId' do
    expect(Users::Types::UserId.new('1')).to be_instance_of Users::Types::UserId
  end
end
