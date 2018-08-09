require 'rubygems'
require 'nokogiri'
require 'open-uri' 
require 'pry'
require 'uri'

class StartScrap
	#-----------------------------------------------------------------------------------
	def initialize
		@market = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all'))
	end
	def get_all_crypto_names(page)
		@crypto_names = []
		idx = 0
		page.xpath('//a[@class="currency-name-container link-secondary"]').each do |name|
			@crypto_names[idx] = name.content
			idx += 1
		end 
		return @crypto_names
	end 
	#-----------------------------------------------------------------------------------
	def get_all_crypto_price(page)
		@crypto_price = []
		idx = 0
		page.xpath('//a[@class="price"]').each do |value|
			@crypto_price[idx] = value.content
			idx += 1
		end 
		return @crypto_price
	end 
	#-----------------------------------------------------------------------------------
	def upcase(word)
		return word.upcase
	end 

	def save
		all_crypto = []
		all_price = []
		all_crypto = get_all_crypto_names(@market)
		all_price = get_all_crypto_price(@market)

		for i in 0..1784
			cryptoname = upcase(all_crypto[i])
			Crypto.create(name: cryptoname, price: all_price[i])
		end 

	    @crypto_hash = all_crypto.zip(all_price)
	    Hash[@crypto_hash]

	    return @crypto_hash
	end

	#-----------------------------------------------------------------------------------
    def perform
    	Crypto.create(name: "test", price: "test")

    	Crypto.all.destroy_all
		save
    end
end 