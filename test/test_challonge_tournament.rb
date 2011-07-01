require 'helper'

class TestChallongeTournament < Test::Unit::TestCase
  context "a tournament" do
    setup do
      @tourney = Challonge::Tournament.find("double_elm_test")
      @tourney.start!
    end
    
    teardown do
      @tourney.reset!
    end
    
    should "fetch the double-elim-test tournament" do
	    assert_not_nil(@tourney, "Failed to retrieve double_elm_test tournament")
    end
    
    should "start a tournament" do  
      @tourney.reset!
      assert(@tourney.start!, "Couldnt start tournament")
    end
        
    should "fetch the array of matches" do
      assert_instance_of(Array, @tourney.matches, "Not getting any matches")
    end
    
    should "fetch all matches in open 'state'" do
      
      matches = @tourney.matches({:state => :open})
      assert_instance_of(Array, matches, "Not returning a array")
      assert(matches.length > 0, "Invalid match count")
    end
    
    should "fetch all matches in pending 'state'" do
      matches = @tourney.matches({:state => :pending})
      assert_instance_of(Array, matches)
      assert(matches.length > 0, "Invalid match count")
    end
    
    should "fetch the array of participants" do
      assert_instance_of(Array, @tourney.participants, "")
    end
  end
  
end
