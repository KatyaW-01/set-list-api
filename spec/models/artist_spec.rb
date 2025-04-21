require "rails_helper"

RSpec.describe Artist do
  it {should have_many :songs}

  describe "class methods" do
    before :each do
      test_data # check the spec_helper file to see which songs/artists exist
    end

    describe "Joins Exploration" do
      # INTRO
      # In a Rails console session (`rails c`), enter the following AR query:
      # `Artist.joins(:songs)`
      # Take note of the SQL that is generated from that command. What do you notice about the components of a join in SQL?
      
      
      # Inspect these two joins. What different components of a join query do you see? What does the ON clause do? Why isn't it necessary in AR?
      it "can get a list of unique names for the artists that have songs with a length greater than 400" do
        query_in_sql = Artist.find_by_sql("SELECT DISTINCT artists.name FROM artists JOIN songs ON artists.id = songs.artist_id WHERE songs.length > 400")
        query_in_ar = Artist.joins(:songs).select("artists.name").where("songs.length > 400").distinct.pluck(:name)
        
        expect(query_in_ar.sort).to eq(["Caamp", "LCD Soundsystem", "Prince", "Run The Jewels"])
      end

      # Try it!
      it "can get a list of the song titles written by Prince" do
        query = Song.find_by_sql("SELECT DISTINCT songs.title FROM songs JOIN artists ON artists.id = songs.artist_id WHERE name = 'Prince'") # You could also try it in AR, too
        
        expect(query.pluck(:title)).to eq(["Purple Rain", "Raspberry Beret"])
      end

      xit "SPICY: can get the name of the artist with the longest song" do
        query = Artist.find_by_sql("")
        
        expect(query.pluck(:name).first).to eq("Run The Jewels")
      end
    end

  end


  describe "instance methods" do
    before :each do
      @prince = Artist.create!(name: "Prince")
      @purple = Song.create!(title: "Purple Rain", length: 845, play_count: 8599, artist_id: @prince.id)
      @beret = Song.create!(title: "Raspberry Beret", length: 664, play_count: 99, artist_id: @prince.id)
      @other_song = Song.create!(title: "Another Prince Song", length: 1, play_count: 99, artist_id: @prince.id)
    end

    describe "#average_song_length" do
      it "returns the average song length" do
        expect(@prince.average_song_length.round(2)).to eq(503.33)
      end
    end
  end
end