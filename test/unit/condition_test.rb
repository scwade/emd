require 'test_helper'

class ConditionTest < ActiveSupport::TestCase

  # load fixtures in case rake -I is used
  fixtures :conditions

  # Test framework
  test "the truth" do
    assert true
  end

# --------------------------------------
# Test format_of :google_url, :wiki_url
# --------------------------------------
  def test_for_format_of_google_and_wiki_url
    # test conditions
    good_google_url = "https://health.google.com/health/ref"
    bad_google_url  = "https://health.google.com/health/re"
    good_wiki_url   = "http://wiki.answers.com"
    bad_wiki_url    = "http://wiki.answers.co"

    # Create object
    c = Condition.new

    # Test for good url format
    c.google_url = good_google_url
    c.wiki_url   = good_wiki_url

    # Force the error check
    c.valid?
    assert !c.errors.invalid?(:google_url)
    assert !c.errors.invalid?(:wiki_url)

    # Test for bad url formats
    c.google_url = bad_google_url
    c.wiki_url   = bad_wiki_url

    # Check for errors
    c.valid?

    assert_equal I18n.translate('activerecord.errors.messages.invalid'), c.errors.on(:google_url)
    assert_equal I18n.translate('activerecord.errors.messages.invalid'), c.errors.on(:wiki_url)
  end

# --------------------------
# Test length_of validation 
# --------------------------
  def test_for_length_of_attributes
    # Need test data
    @max_255 = 'a'*255

    # Lets test limits
    c = Condition.new(:name => @max_255 + "z")

    # Force error
    assert !c.valid?

    # Check @errors{}
    assert c.errors.invalid?(:name)

    # Check @errors{} msg
    assert_equal I18n.translate('activerecord.errors.messages.too_long',  :count => 255 ), c.errors.on(:name)

    # Lets test limits ok at max
    c = Condition.new(:name => @max_255)

    assert c.valid?

    # Check @errors{} not reported
    assert !c.errors.invalid?(:name)
  end

# ----------------------------
# Test presence_of validation
# ----------------------------
  def test_for_presence_of_attributes

    # Create object
    c = Condition.new 

    #Force validation check with
    assert !c.valid?

    # Check @errors{} at least one error reported
    assert c.errors.invalid?(:name)
  end

# ----------------------------
# Test uniqness_of validation
# ----------------------------
  def test_for_uniqness_of_attributes
    # Use test fixture data
    c = Condition.create(:name => conditions(:one).name)

    # Check @errors{}
    assert c.errors.invalid?(:name)

    # Check @errors{} msg
    assert_equal I18n.translate('activerecord.errors.messages.taken'), c.errors.on(:name)
  end

# ---------------------------------------------------------------------------------------
# Now see if we can add at least one
# -------------------------------------------------------------------------------------
  def test_for_create_condition_is_valid
    # Create object
    c = Condition.create(:name => "Headache")

    # Check object is valid
    assert c.valid?
  end

# ---------------------------
# End of ConditionTest
# ---------------------------
end

