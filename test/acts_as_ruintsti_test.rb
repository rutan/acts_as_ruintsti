# coding: utf-8
require 'test_helper'

class Box < ActiveRecord::Base
  acts_as_ruintsti({
    1 => 'WhiteBox',
    2 => 'BlackBox',
  })
end
class WhiteBox < Box; end
class BlackBox < Box; end

class Block < ActiveRecord::Base
  acts_as_ruintsti({
    1 => 'RedBlock',
    2 => 'BlueBlock',
  })
end
class RedBlock < Block; end
class BlueBlock < Block; end


class ActsAsRuintstiTest < ActiveSupport::TestCase
  def setup
    @red = RedBlock.new
    @blue = BlueBlock.new
    @red.save
    @blue.save
  end

  def teardown
    @red.delete
    @blue.delete
  end

  test "RedBlock's type is 1" do
    assert_equal RedBlock.sti_name, 1
    assert_equal @red.type, 1
    assert_equal Block.find(@red.id).type, 1
  end

  test "BlueBlock's type is 2" do
    assert_equal BlueBlock.sti_name, 2
    assert_equal @blue.type, 2
    assert_equal Block.find(@blue.id).type, 2
  end

  test "loaded RedBlock's class is RedBlock" do
    assert_equal Block.find(@red.id).class, RedBlock
  end

  test "loaded BlueBlock's class is BlueBlock" do
    assert_equal Block.find(@blue.id).class, BlueBlock
  end

  test "when create block type=1, created RedBlock" do
    assert_equal Block.new(:type => 1).class, RedBlock
  end

  test "when create block type='2', created BlueBlock" do
    assert_equal Block.new(:type => '2').class, BlueBlock
  end

  test "when create block type=3, raise SubclassNotFound" do
    assert_raise ActiveRecord::SubclassNotFound do
      Block.new(:type => 3)
    end
  end

  test "when create block type='hoge', raise SubclassNotFound" do
    assert_raise ActiveRecord::SubclassNotFound do
      Block.new(:type => 'hoge')
    end
  end

  test "acts_as_ruintsti_params is different between Block and Box" do
    assert_not_equal Block.acts_as_ruintsti_params, Box.acts_as_ruintsti_params
  end
end
