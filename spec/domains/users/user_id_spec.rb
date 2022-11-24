require 'rails_helper'

RSpec.describe 'UserId' do
  UserId = Users::Types::UserId

  it 'should raise ObjectValidationError(blank)' do
    expect { UserId.new('') }.to raise_error Exceptions::ObjectValidationError
  end

  it 'should create a UserId' do
    expect(UserId.new('1')).to be_instance_of UserId
  end
end
