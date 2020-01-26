require "dicemypass/version"

module Dicemypass
  # First we load the absolute path of our eff_long_wordlist.txt.
  @eff_wordlist = File.dirname(__FILE__) + '/dicemypass/assets/eff_long_wordlist.txt'

  # The default passphrase length should be 7
  def self.gen_passphrase(pass_length = 7)

    # Read filename eff_long_wordlist and save it as a list.
    wordlist = File.readlines(@eff_wordlist)

    # Strip the '\n' out of every line.
    wordlist.map(&:strip!)

    # Shuffle the list and return a list up to pass_length words
    # which in the case would be equal to 7 words.
    wordlist.shuffle[0...pass_length]
  end
end
