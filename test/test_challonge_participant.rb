require 'helper'

class TestChallongeParticipant < Test::Unit::TestCase
  context "a participant" do
    setup do
      @t = Challonge::Tournament.find("double_elm_test")
      @t.start!
      m = @t.matches.first

      @mParticipant1 = m.player1
      @mParticipant2 = m.player2
      @nParticipant = Challonge::Participant.new(:tournament => @t)
    end
    
    should "save a new participant" do
      @nParticipant.name = "TestUser"
      @t.reset!
      assert(@nParticipant.save,"Save failed, #{@nParticipant.errors}")
      @nParticipant.destroy if @nParticipant.exists?
    end
    
    should "get the name of a player" do
      assert_not_nil(@mParticipant1.name)
      assert_not_nil(@mParticipant2.name)
    end
  end
end