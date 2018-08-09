class HomeController < ApplicationController		
	def index
		@crypto = Crypto.all
		@words = Home.all
	end 

	def new 
		Home.new
	end 

	def upcase(word)
		return word.upcase
	end 

	def search
		Home.create(word: "test")
    	Home.all.destroy_all

  		@r = Home.new word: params[:word]
  		@home = upcase(@r.word)
  		@r.word = @home
  		@r.save
		StartScrap.new.perform

		redirect_to root_path
	end 

end
