require 'spec_helper'

describe MoviesController do 
  describe "searching for movies by director" do
    before :each do
      @fake_results = [mock('movie'), mock('movie2')]
      @mock_movie = mock('movie')
      @mock_movie.stub!(:director).and_return('mock director')
      Movie.should_receive(:find_by_id).with('1').and_return(@mock_movie)
    end
    it "should call the model method find_movies_by_director" do

      Movie.should_receive(:find_movies_by_director).with(@mock_movie.director).
      and_return(@fake_results)
      get :similar, { :id => "1"}
    end
    
    describe "displaying results" do
      before :each do
        Movie.stub(:find_movies_by_director).and_return(@fake_results)
        get :similar, { :id => '1'}
      end
      it "should render results in a new view" do
        response.should render_template('similar')
      end
      it 'should make the results available to that template' do
        assigns(:movies).should == @fake_results
      end
    end
  end

  describe "when movie has no director" do
    before do
      @mock_movie.stub!(:director).and_return('')
      @mock_movie.stub!(:title).and_return('random title')
      get :similar, { :id => '1'}
    end
    it "should redirect to the home page" do
      response.should redirect_to(movies_path)
    end
  end

end