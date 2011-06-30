require 'helper'

class TestChallongeParticipant < Test::Unit::TestCase
  context "a participant" do
    setup do
      t = Challonge::Tournament.find("double_elm_test")
      m = t.matches.first
      @mParticipant = m.player2
      @nParticipant = Challonge::Participant.new(:tournament => t)
    end
    
    teardown do
      @nParticipant.delete!
    end
    
    should "save a new participant" do
      @nParticipant.name = "TestUser"
      assert(@nParticipant.save,"Save failed")
    end
    
    should "get the name of a player" do
      assert_not_nil(@nParticipant.name)
      assert_not_nil(@mParticipant.name)
    end
  end
end