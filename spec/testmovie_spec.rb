require_relative '../moviecode.rb'


describe "If the query has an Image" do 
	
	it "It is shown" do
		

		imdb_api = double("imdb_api")
		imdb_api.stub(:new).and_return([])

		results = MovieSearcher.new(imdb_api).search('hodor')
		#expect(results.first.poster).not_to eq(nil)

		#expect(results).to eq(13)
		expect(extract_with_posters()).to eq ([])

	end


end