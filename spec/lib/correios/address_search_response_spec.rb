# encoding: UTF-8
require 'spec_helper'
require 'correios/address_search_response'

describe Correios::AddressSearchResponse do
  include RuaBentoGoncalvesNovoHamburgoSearch

  let(:html) { response_fixture("rua_bento_goncalves_novo_hamburgo") }

  subject { Correios::AddressSearchResponse.new(html) }

  its(:body) { should eq(html) }

  describe "#items" do
    it "returns the Nokogiri nodes that caontains each response item" do
      expect(subject.send(:items).length).to eq(addresses.length)
    end
  end

  describe "#address" do
    it "receives a Nokogiri node and return the address" do
      node = subject.send(:items).first
      expect(subject.send(:address, node)).to eq(address_1)
    end
  end

  describe "#addresses" do
    it "returns the correct hash addresses" do
      subject.addresses.each do |address|
        addresses.should include(address)
      end
    end

    it "returns in the correct order"
  end

  describe "#set_up_address" do
    it "adds tipo_logradouro key" do
      address = {logradouro: 'Rua One Two'}
      expect(subject.send(:set_up_address, address)).to eq(address.merge(tipo_logradouro: 'Rua'))

      address = {logradouro: 'Avenida One Two'}
      expect(subject.send(:set_up_address, address)).to eq(address.merge(tipo_logradouro: 'Avenida'))
    end
  end

  describe "#clean_content" do
    it "removes leading and trailing spaces" do
      content = "  con   tent  "
      expect(subject.send(:clean_content, content)).to eq('con tent')
    end

    it "removes line breaks" do
      content = "\n\ncon\n  \ntent\n\n"
      expect(subject.send(:clean_content, content)).to eq('con tent')
    end
  end

  describe "#content_to_key" do
    it "converts values to key" do
      expect(subject.send(:content_to_key, "\nEndereço")).to eq(:endereco)
      expect(subject.send(:content_to_key, "\sBairro")).to eq(:bairro)
      expect(subject.send(:content_to_key, "Localidade/UF")).to eq([:localidade, :uf])
      expect(subject.send(:content_to_key, "Localidade\n / UF")).to eq([:localidade, :uf])
      expect(subject.send(:content_to_key, "CEP")).to eq(:cep)
      expect(subject.send(:content_to_key, "Unidade")).to eq(:unidade)
    end
  end

  describe "#content_to_hash" do
    it "converts values to key" do
      content = "\n  Novo Hamburgo\n\n   /RS\n\n "
      value = subject.send(:content_to_hash, content, [:a, :b])
      expect(value).to eq(a: "Novo Hamburgo", b: "RS")

      content = "\n  Rua Bento Gonçalves - até 999/1000\n\n "
      value = subject.send(:content_to_hash, content, :a)
      expect(value).to eq(a: "Rua Bento Gonçalves - até 999/1000")

      content = "\n  Rua Bento Gonçalves - de 1001/1002 a 1699/1700\n\n  "
      value = subject.send(:content_to_hash, content, :a)
      expect(value).to eq(a: "Rua Bento Gonçalves - de 1001/1002 a 1699/1700")
    end
  end
end