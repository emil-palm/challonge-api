require 'helper'

class TestChallongeTournament < Test::Unit::TestCase
  context "a tournament" do
    setup do
      @tourney = Challonge::Tournament.find("double_elm_test")
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
    
    should "fetch the array of participants" do
      assert_instance_of(Array, @tourney.participants, "")
    end
  end
  
end
