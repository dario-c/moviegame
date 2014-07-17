require_relative '../moviecode.rb'

describe "the poster retrieval" do
	before :each do
		@movie_info = double("the movie database")   
				#makes fake
		@poster_retriever = PosterRetriever.new(@movie_db) 
				#makes a Class instance w the fake
	end


	it "must retrieve one poster if we only have one poster" do
		@movie_db.stub(:posters).and_return(["www.url.com"]) 
				#movie_db.posters --is to be--> ["www.url.com"]
		expect(@poster_retriever.get_posters("query")).to eq(["www.url.com"])
				#The Class has to have a method that returns...
	end
end