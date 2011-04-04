require 'test/unit'
require 'rubygems'

require "#{File.dirname(__FILE__)}/../init"

class SexyTempPasswordsTest < Test::Unit::TestCase

  def test_sexy_temp_password
    10.times do
      random_pass = SexyTempPassword.generate
      length = random_pass.size
      word_part, num_part = random_pass[0..(length-5)], random_pass[(length-4), length]
      for i in (0..3)
        j = num_part[i..i].to_i
        assert(1 <= j)
        assert(j <= 9)
      end
      assert(word_array.include?(word_part))
    end
  end
  
  private
  
  def word_array
    path = File.join($sexy_plugin_path, 'sexy-passwords.txt')
    File.open(path).read.split(/\n/)
  end
  
end
