# encoding: UTF-8
require 'spec_helper'
require 'cep'

describe "address search" do
  include RuaBentoGoncalvesNovoHamburgoSearch

  context "when searching for 'Rua Bento Gonçalves Novo Hamburgo'" do
    subject { Cep.new.search(term) }

    it "returnes the expected result" do
      subject.should =~ addresses
    end

    it "returnes the expected result in the same order" do
      expect(subject).to eq(addresses)
    end
  end
end
