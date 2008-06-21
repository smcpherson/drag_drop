require File.dirname(__FILE__) + '/../test_helper'
require 'script_controller'

# Re-raise errors caught by the controller.
class ScriptController; def rescue_action(e) raise e end; end

class ScriptControllerTest < Test::Unit::TestCase
  def setup
    @controller = ScriptController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
