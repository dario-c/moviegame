require 'sinatra'
require 'date'
require 'pry'
require 'pstore'
require 'yaml/store'
require 'imdb'


class MovieSearcher
	def initialize api
		@api = api
	end

	def search query
		#Imdb::Search.new(@query)
		results = @api.new query
		results
	end


end

#searcher = MovieSearcher.new Imdb::Search 


get '/' do
	
	erb :search

end

post '/query' do

	@query = params[:searchit]
	redirect to("/game?new=#{@query}")
end

get '/game' do
	@query = params[:new]
	search = Imdb::Search.new(@query)
	@posters = search.movies.first(20).map { |each| each.poster}
	@imgposters = @posters.compact.first(6)
	erb :movie

end





=begin
def intAdd(string)
string.gsub!('/n',"")
 string.length > 1 ? 
string.split(",").map{|num| num.to_i}.inject(0){|a,b| a+b}
: string.to_i
end
=end
