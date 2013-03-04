require 'spec_helper'
require 'cep'

describe Cep do
  describe "#address" do
    subject { Cep.new.address('93320220') }

    it "gets logradouro" do
      subject[:logradouro].should eq("Rua Guanabara")
    end

    it "gets bairro" do
      subject[:bairro].should eq("Ouro Branco")
    end

    it "gets localidade" do
      subject[:localidade].should eq("Novo Hamburgo")
    end

    it "gets localidade" do
      subject[:estado].should eq("RS")
    end

    it "gets cep" do
      subject[:cep].should eq("93320220")
    end
  end


  describe "#url" do
    it "builds ws url with params" do
      url = Cep.new.url({p1: 'v1', p2: 'v2'})
      url.should eq(Cep::URL + '?p1=v1&p2=v2')
    end
  end
end