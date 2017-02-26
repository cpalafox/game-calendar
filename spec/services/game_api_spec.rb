require "rails_helper"

describe GameApi do
  describe '#get' do
    it 'makes a unirest get call' do
      allow(Unirest).to receive(:get) { double(:response, { "results" => [] }) }
    end
  end
end
