class WelcomeController < ApplicationController

	def hello
		@message = "Hello with a variable"
	end
end
