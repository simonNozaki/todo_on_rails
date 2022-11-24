require 'rails_helper'

describe 'Title' do
  Title = Todos::Types::Title
  it 'should raise error with blank' do
    expect { Title.new('') }.to raise_error Exceptions::ObjectValidationError
  end

  it 'should raise error with too long title chars' do
    expect { Title.new("a" * 51) }.to raise_error Exceptions::ObjectValidationError
  end

  it 'should create domain object' do
    expect(Title.new('coding')).to be_instance_of Title
  end
end
