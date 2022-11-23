require 'rails_helper'

describe 'Title' do
  it 'should raise error with blank' do
    expect { Todos::Types::Title.new('') }.to raise_error Exceptions::ObjectValidationError
  end

  it 'should raise error with too long title chars' do
    expect { Todos::Types::Title.new("a" * 51) }.to raise_error Exceptions::ObjectValidationError
  end

  it 'should create domain object' do
    expect(Todos::Types::Title.new('coding')).to be_instance_of Todos::Types::Title
  end
end
