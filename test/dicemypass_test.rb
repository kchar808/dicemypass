require "test_helper"
require 'dicemypass'

class DicemypassTest < Minitest::Test
  # def setup; end

  def test_that_it_has_a_version_number
    refute_nil ::Dicemypass::VERSION
  end

  # def test_gen_passphrase; end
  def test_gen_passphrase
    # gen_passphrase should generate and respect prassphrase length
    passphrase3 = Dicemypass.gen_passphrase(3)
    passphrase_default = Dicemypass.gen_passphrase
    passphrase12 = Dicemypass.gen_passphrase(12)
    assert_equal passphrase3.length, 3, 'Passphrase length != 3'
    assert_equal passphrase_default.length, 7, 'Passphrase length != 7'
    assert_equal passphrase12.length, 12, 'Passphrase length != 12'
  end

  # def test_vulnerable_pass; end
  def test_vulnerable_pass
    # check_pwned should flag this password
    vuln_count = Dicemypass.check_pwned('passw0rd')
    refute_nil vuln_count
  end

  # def test_secure_pass; end
end
