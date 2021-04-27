require_relative '../lib/motivation'
require_relative '../lib/joke'

describe Motivation do
    describe '#make_motive_request' do
    let(:make_request) {Motivation.new}
    let(:ask_json) {make_request.make_motive_request}
    it 'Returns a JSON object' do
        expect(ask_json.class).to eql(Array)
    end

    it 'Returns a non JSON object' do
        expect(ask_json.length).to_not eql(0)
    end
end