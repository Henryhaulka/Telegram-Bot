require_relative '../lib/motivation'
require_relative '../lib/joke'
require_relative '../lib/bot'

describe Motivation do
  describe '#make_motive_request' do
    let(:make_request) { Motivation.new }
    let(:ask_json) { make_request.make_motive_request }
    it 'Returns a JSON object' do
      expect(ask_json.class).to eql(Array)
    end

    it 'Returns a non JSON object' do
      expect(ask_json.length).to_not eql(0)
    end
    describe '#random_quote' do
      let(:make_quote) { Motivation.new }
      let(:ask_json) { make_request.random_quote }
      it 'Returns an Hash' do
        expect(ask_json.class).to eql(Hash)
      end
      it 'Returns a key and value pair' do
        expect(ask_json.length).to eql(2)
      end
    end
  end
  describe '#initialize' do
    it "Returns a method" do
      expect(@motive).to eql(@make_motive_request)
    end
  end
  describe '#random_quote' do
    it "Returns a another method" do
      expect(@motive).to eql(@motive)
    end
  end
end

describe JokeLib do
  describe '#inquire_a_request' do
    let(:request) { JokeLib.new }
    let(:ask_json) { request.inquire_a_request }
    it 'Returns a Hash' do
      expect(ask_json.class).to eql(Hash)
    end
    it 'Returns a non Json object' do
      expect(ask_json.length).to_not eql(0)
    end
  end
end

describe Bot do
  describe '#initialize' do
      it 'Returns a Private method' do
         expect(@access).to eql(@validate)
      end
  end
  describe '#validate' do
      it 'Returns a message' do
         expect( @bot).to eql(@message)
      end
  end
end