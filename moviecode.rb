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


class PosterRetriever

	def initialize(@movie_info)#the real stuff will eventually fit here!
		@movie_info = movie_db
	end

	def get_posters(query)
		@movie_info.posters(query).compact.take(9)
		#transform the fake stuff to what I want
	end



end
