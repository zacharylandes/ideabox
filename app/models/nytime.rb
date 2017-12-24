require 'uri'
require 'net/http'
require 'net/https'
require 'json'
require 'open-uri'
require 'nokogiri'


class Nytime < ApplicationRecord
  has_and_belongs_to_many :ideas, :dependent => :destroy

    def self.nytimes(search)
      uri = URI("https://api.nytimes.com/svc/search/v2/articlesearch.json")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      uri.query = URI.encode_www_form({
        "api-key" => "369c32be808d4b28b3ecaca9ef4a4abc",
        "fq" => search,
        "sort" => "newest"
      })
      request = Net::HTTP::Get.new(uri.request_uri)
      @result = JSON.parse(http.request(request).body)
    end

    def self.nytimes_body(search)
       @result = nytimes(search)['response']['docs'][0]['web_url']
       doc = Nokogiri::HTML(open("#{@result}"))
       doc= doc.css('p')
       doc.text.gsub(/[\r\n]+/,"\n").strip
    end

    def self.nytimes_title(search)
       nytimes(search)['response']['docs'][0]['headline']['main']
    end



end
