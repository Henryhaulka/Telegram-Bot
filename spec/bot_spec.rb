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
        describe '#random_quote' do
            let(:make_quote) {Motivation.new}
            let(:ask_json) {make_request.random_quote}
            it 'Returns an Hash' do
                expect(ask_json.class).to eql(Hash)
            end
            it 'Returns a key and value pair' do
                expect(ask_json.length).to eql(2)
            end
        end
    end
end

describe JokeLib do
    describe '#inquire_a_request' do
        let(:request) {JokeLib.new}
        let(:ask_json) {request.inquire_a_request}
        it 'Returns a Hash' do
            expect(ask_json.class).to eql(Hash)
        end
        it 'Returns a non Json object' do
            expect(ask_json.length).to_not eql(0)
         end
    end     
    
end

