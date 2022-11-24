require 'rails_helper'

describe 'Deadline' do
  Deadline = Todos::Types::Deadline

  context 'validation errors' do
    it 'should raise error by not formatted time string' do
      expect { Deadline.new(Time.parse('today')) }.to raise_error ArgumentError
    end

    it "should create deadline object" do
      today = Time.parse('2022-11-17')
      deadline = Time.parse('2022-11-20')
      expect(Deadline.new(deadline, today).value.to_s).to eq("2022-11-20 00:00:00 +0900")
    end
  end

  context 'success' do
    it "should create deadline object from string" do
      today = '2022-11-17'
      deadline = '2022-11-20'
      expect(Deadline.from_s(deadline, today).value).to eq(Time.parse(deadline))
    end
  end
end
