require 'spec_helper'

RSpec.describe Concurrency do
  # subject {Concurrency.new}

  describe '#converts' do
    let(:input) {[200, 'USD', 'INR']}
    let(:output) { Concurrency.converts(input) }
  end

  it 'converts USD to INR' do
    expect(output).to be_a(Float)
  end

  # it 'has a version number' do
  #   expect(Concurrency::VERSION).not_to be nil
  # end

  # it 'does something useful' do
  #   expect(false).to eq(true)
  # end

end
