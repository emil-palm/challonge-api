require 'helper'

class TestChallongeMatch < Test::Unit::TestCase
  context "a match" do
    setup do
      @t = Challonge::Tournament.find("double_elm_test")
      @t.start!
      @match = @t.matches.first
    end
    
    teardown do
      @t.reset!
    end

    should "get players of this match" do
      assert_instance_of(Challonge::Participant, @match.player1, "Got wrong type of object for player1")
      assert_instance_of(Challonge::Participant,@match.player2, "Got wrong type of object for player2")
    end

    context "test results of the match" do
      setup do
        @match.scores_csv = "3-1" # Player 1 wins
        @match.winner_id = @match.player1.id
      end

      teardown do
        @match.scores_csv = ""
        @match.winner_id = nil
        @match.save
      end

      should "save the match details" do
        assert(@match.save)
      end

      should "check if player1 is the winner" do
        @match.save
        assert(@match.player_winner? @match.player1)
      end
    end
  end
end