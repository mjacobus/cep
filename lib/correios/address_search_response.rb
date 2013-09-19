require 'nokogiri'
# TODO: Cherry pick inflections
require 'active_support/all'

module Correios
  class AddressSearchResponse
    attr_reader :body

    def initialize(html_body)
      @body = html_body
    end

    def addresses
      @addresses ||= items.map{|item| address(item)}
    end

    private
      def address(node)
        titles = node.css('.resposta').map(&:content).map do |content|
          content_to_key(content)
        end

        contents = node.css('.respostadestaque').map(&:content).map do |content|
          clean_content(content)
        end

        hash = {}
        contents.each_with_index do |content, index|
          hash.merge!(content_to_hash(content, titles[index]))
        end
        set_up_address(hash)
      end

      def set_up_address(address)
        if address[:logradouro]
          tipo_logradouro = address[:logradouro].split(' ').first
          address.merge!(tipo_logradouro: tipo_logradouro)
        end
        address
      end

      def items
        @items ||= Nokogiri::HTML(body).css('.caixacampobranco, .caixacampoazul')
      end

      def clean_content(content)
        content.gsub(/\n+/,' ').
          gsub(/^\n+/, '').
          strip.gsub(/\s+/, ' ')
      end

      def content_to_key(content)
        parts = clean_content(content).split('/').map do |content|
          content.parameterize.to_sym
        end

        if parts.length == 1
          parts = parts.first
        end

        parts
      end

      def content_to_hash(content, keys)
        if keys.is_a?(Symbol)
          {keys => clean_content(content)}
        else
          contents = clean_content(content).split('/')
          contents_copy = contents.dup
          values = {}
          keys.each_with_index do |key, index|
            content = contents_copy[index]
            values[key] = clean_content(contents.delete(content))
          end
          unless contents.empty?
            values[keys.last] += '/' + contents.join('/')
          end
          values
        end

      end
  end
end