require "cat_facts"
require 'net/http'

RSpec.describe CatFacts do
    it "generates and returns a random cat fact" do
        requester_double = double :requester
        expect(requester_double).to receive(:get).with(URI("https://catfact.ninja/fact")).and_return('{"fact":"Despite imagery of cats happily drinking milk from saucers, studies indicate that cats are actually lactose intolerant and should avoid it entirely.","length":148}')
        cat_facts = CatFacts.new(requester_double)
        expect(cat_facts.provide).to eq "Cat fact: Despite imagery of cats happily drinking milk from saucers, studies indicate that cats are actually lactose intolerant and should avoid it entirely."
    end
end

