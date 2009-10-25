require 'test_helper'

class EditransactionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  # -----------------------------------------------------------------------------------------
  # Test presence_of validation
  # -----------------------------------------------------------------------------------------
  def test_for_presence_of_attributes

    # Create object
    e = Editransaction.new

    #Force validation check with
    assert !e.valid?

    # Check @errors{} at least one error reported
    assert e.errors.invalid?(:isa01)
    assert e.errors.invalid?(:isa02)

  end

  # ---------------------------------------------------------------------------------------
  # Now see if we can add at least one
  # -------------------------------------------------------------------------------------
  def test_for_create_editransaction_is_valid

    # Create object
    e = Editransaction.create(:isa01 => 'ab',
                              :isa02 => 'abcdefghij')

    # Check object is valid
    assert e.valid?
  end

  # ---------------------------------------------------------------------------------------------
  # Test length_of validation
  # ---------------------------------------------------------------------------------------------
  def test_for_length_of_attributes
    # Need test data
    @max_15 = @max_10 = @max_9 = @max_6 = @max_5 = @max_4 = @max_2 = @max_1 = ""
    15.times { @max_15 = @max_15 + "a" }
    10.times { @max_10 = @max_10 + "a" }
     9.times { @max_9  = @max_9  + "a" }
     6.times { @max_6  = @max_6  + "a" }
     5.times { @max_5  = @max_5  + "a" }
     4.times { @max_4  = @max_4  + "a" }
     2.times { @max_2  = @max_2  + "a" }
     1.times { @max_1  = @max_1  + "a" }

    # Now array to string
    @max_15 = @max_15.to_s
    @max_10 = @max_10.to_s
    @max_9  = @max_9.to_s
    @max_6  = @max_6.to_s
    @max_5  = @max_5.to_s
    @max_4  = @max_4.to_s
    @max_2  = @max_2.to_s
    @max_1  = @max_1.to_s

    # Lets test limits
    e = Editransaction.new(:isa01 => @max_2  + "z",
                           :isa02 => @max_10 + "y",
                           :isa03 => @max_2  + "x",
                           :isa04 => @max_10 + "w",
                           :isa05 => @max_2  + "v",
                           :isa06 => @max_15 + "u",
                           :isa07 => @max_2  + "t",
                           :isa08 => @max_15 + "s",
                           :isa09 => @max_6  + "r",
                           :isa10 => @max_4  + "q",
                           :isa11 => @max_1  + "p",
                           :isa12 => @max_5  + "o",
                           :isa13 => @max_9  + "n",
                           :isa14 => @max_1  + "m",
                           :isa15 => @max_1  + "l",
                           :isa16 => @max_1  + "k")

    assert !e.valid?

    # Check @errors{}
    assert e.errors.invalid?(:isa01)
    assert e.errors.invalid?(:isa02)
    assert e.errors.invalid?(:isa03)
    assert e.errors.invalid?(:isa04)
    assert e.errors.invalid?(:isa05)
    assert e.errors.invalid?(:isa06)
    assert e.errors.invalid?(:isa07)
    assert e.errors.invalid?(:isa08)
    assert e.errors.invalid?(:isa09)
    assert e.errors.invalid?(:isa10)
    assert e.errors.invalid?(:isa11)
    assert e.errors.invalid?(:isa12)
    assert e.errors.invalid?(:isa13)
    assert e.errors.invalid?(:isa14)
    assert e.errors.invalid?(:isa15)
    assert e.errors.invalid?(:isa16)


    # Check @errors{} msg
    assert_equal I18n.translate('activerecord.errors.messages.too_long',  :count=>2 ), e.errors.on(:isa01)
    assert_equal I18n.translate('activerecord.errors.messages.too_long',  :count=>10), e.errors.on(:isa02)
    assert_equal I18n.translate('activerecord.errors.messages.too_long',  :count=>2 ), e.errors.on(:isa03)
    assert_equal I18n.translate('activerecord.errors.messages.too_long',  :count=>10), e.errors.on(:isa04)
    assert_equal I18n.translate('activerecord.errors.messages.too_long',  :count=>2 ), e.errors.on(:isa05)
    assert_equal I18n.translate('activerecord.errors.messages.too_long',  :count=>15), e.errors.on(:isa06)
    assert_equal I18n.translate('activerecord.errors.messages.too_long',  :count=>2 ), e.errors.on(:isa07)
    assert_equal I18n.translate('activerecord.errors.messages.too_long',  :count=>15), e.errors.on(:isa08)
    assert_equal I18n.translate('activerecord.errors.messages.too_long',  :count=>6 ), e.errors.on(:isa09)
    assert_equal I18n.translate('activerecord.errors.messages.too_long',  :count=>4 ), e.errors.on(:isa10)
    assert_equal I18n.translate('activerecord.errors.messages.too_long',  :count=>1 ), e.errors.on(:isa11)
    assert_equal I18n.translate('activerecord.errors.messages.too_long',  :count=>5 ), e.errors.on(:isa12)
    assert_equal I18n.translate('activerecord.errors.messages.too_long',  :count=>9 ), e.errors.on(:isa13)
    assert_equal I18n.translate('activerecord.errors.messages.too_long',  :count=>1 ), e.errors.on(:isa14)
    assert_equal I18n.translate('activerecord.errors.messages.too_long',  :count=>1 ), e.errors.on(:isa15)
    assert_equal I18n.translate('activerecord.errors.messages.too_long',  :count=>1 ), e.errors.on(:isa16)



    # Lets test limits ok at max
    e = Editransaction.new(:isa01 => @max_2,
                           :isa02 => @max_10,
                           :isa03 => @max_2,
                           :isa04 => @max_10,
                           :isa05 => @max_2,
                           :isa06 => @max_15,
                           :isa07 => @max_2,
                           :isa08 => @max_15,
                           :isa09 => @max_6,
                           :isa10 => @max_4,
                           :isa11 => @max_1,
                           :isa12 => @max_5,
                           :isa13 => @max_9,
                           :isa14 => @max_1,
                           :isa15 => @max_1,
                           :isa16 => @max_1)

    assert e.valid?

    # Check @errors{} not reported
    assert !e.errors.invalid?(:isa01)
    assert !e.errors.invalid?(:isa02)
    assert !e.errors.invalid?(:isa03)
    assert !e.errors.invalid?(:isa04)
    assert !e.errors.invalid?(:isa05)
    assert !e.errors.invalid?(:isa06)
    assert !e.errors.invalid?(:isa07)
    assert !e.errors.invalid?(:isa08)
    assert !e.errors.invalid?(:isa09)
    assert !e.errors.invalid?(:isa10)
    assert !e.errors.invalid?(:isa11)
    assert !e.errors.invalid?(:isa12)
    assert !e.errors.invalid?(:isa13)
    assert !e.errors.invalid?(:isa14)
    assert !e.errors.invalid?(:isa15)
    assert !e.errors.invalid?(:isa16)


  end

# ---------------------------
# End of EditransactionTest
# ---------------------------

end
