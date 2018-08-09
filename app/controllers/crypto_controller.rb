class CryptoController < ApplicationController

	def new 
		Crypto.new
	end 

	def create
		Crypto.create()
		@crypto = Crypto.new(crypto_params)
        @crypto.save
	end 

  private
  def crypto_params
      params.require(:crypto).permit(:name, :price)
  end 
end 