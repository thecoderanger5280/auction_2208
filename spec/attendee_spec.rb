require 'rspec'
require './lib/attendee'

RSpec.describe Attendee do
  describe '#initialize' do
    it 'exists' do
      attendee = Attendee.new({name: 'Megan', budget: '$50'})

      expect(attendee).to be_an_instance_of(Attendee)
    end

    it 'has a name' do
      attendee = Attendee.new({name: 'Megan', budget: '$50'})

      expect(attendee.name).to eq('Megan')
    end

    it 'has a budget' do
      attendee = Attendee.new({name: 'Megan', budget: '$50'})

      expect(attendee.budget).to eq(50)
    end
  end
end