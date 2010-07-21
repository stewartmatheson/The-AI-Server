require 'abstract_unit'
require 'rules/capture_rallypoint'
class ExternalRuleTest < Test::Unit::TestCase
  
  class TestRuleStub
    include RDAI::Rule
    attr_accessor :name
    acts_as_rule
    
    def initialize
      @name = 'capture_rallypoint'
    end
  end
  
  def setup
    @t = TestRuleStub.new
  end
  
  def test_stub_class
    assert_equal('capture_rallypoint', @t.name)
  end
  
  def test_rule_mixin
    assert_equal(:CaptureRallyPointFired, @t.fire )
  end
  
end