require 'spec_helper'
require 'cep'

describe Cep do
  describe "#address with cep" do
    subject { Cep.new.cep('93320220') }

    it "gets tipo_logradouro" do
      subject[:tipo_logradouro].should eq("Rua")
    end

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
      subject[:uf].should eq("RS")
    end

    it "gets cep" do
      subject[:cep].should eq("93320220")
    end
  end

  describe "#cep with address" do
    subject { Cep.new.address('Avenida Conde da Boa Vista')[0] }

    it "gets tipo_logradouro" do
      subject[:tipo_logradouro].should eq("Avenida")
    end

    it "gets logradouro" do
      subject[:logradouro].should eq("Avenida Conde de Boa Vista")
    end

    it "gets bairro" do
      subject[:bairro].should eq("Jardim Tijuca")
    end

    it "gets localidade" do
      subject[:localidade].should eq("Campo Grande")
    end

    it "gets localidade" do
      subject[:uf].should eq("MS")
    end

    it "gets cep" do
      subject[:cep].should eq("79094050")
    end
  end

  describe "#url" do
    it "builds ws url with params" do
      url = Cep.new.url({p1: 'v1', p2: 'v2'})
      url.should eq(Cep::URL + '?p1=v1&p2=v2')
    end
  end
end