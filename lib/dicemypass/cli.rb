require 'thor'
require 'dicemypass'
require 'colorize'
require 'clipboard'

module Dicemypass
  class CLI < Thor
    desc 'gen [length]', 'Generate a passphrase of the desired length.'
    method_option :clipboard,
                  aliases: '-c',
                  type: :boolean,
                  desc: 'Copy passphrase to clipboard.'
    method_option :hibp,
                  aliases: '-H',
                  type: :boolean,
                  desc: 'Check if passphrase is vulnerable in HIBP database.'
    def gen_pass(pass_length = 7)
      # Force our length value to be an integer
      new_passphrase = Dicemypass.gen_passphrase(pass_length.to_i)

      # If our options :clipboard and :hibp are true, then proceeds
      # to copy the contents of the passphrase to the clipboard
      # and check if the passphrase is vulnerable.
      Clipboard.copy(new_passphrase.join(' ')) if options[:clipboard]
      dataset_count = Dicemypass.check_pwned(new_passphrase) if options[:hibp]

      # To add colors, first we store the available colors in a variable
      # but we eliminate the color black which makes some words to be
      # unreadable in the terminal. After that, we map the passphrase list
      # and assign a random color to each one of them.
      colors = String.colors
      colors.delete(:black) # black color looks ugly in the terminal
      new_passphrase.map! do |phrase|
        random_color = colors.sample
        phrase.colorize(random_color)
      end
      # We add default messages in case our options are activated. A green bold
      # message when the user wants to copy the passphrase, another one if the
      # passphrase is safe, and a red bold one if the passphrase is vulnerable.
      copy_msg = '- Copied to clipboard.'.bold.green
      vuln_pass_msg = "- WARNING: Passphrase appears in #{dataset_count} datasets!".red.bold
      safe_pass_msg = '- Password was not found in a dataset.'.green.bold

      # Bold the title passphrase and then join the passphrase to make it a string.
      puts '- Passphrase: '.bold + new_passphrase.join(' ')

      # If the clipboard option is active then display the clipboard message
      puts copy_msg if options[:clipboard]
      # If the option :hibp is True then check if the pass is found in a dataset.
      # If dataset_cout is not nil then display vuln_pass_msg, else display
      # the safe_pass_msg.
      puts dataset_count ? vuln_pass_msg : safe_pass_msg if options[:hibp]
    end
    
    desc 'check', 'Check if a password/passphrase is vulnerable.'
    def check_pass
      puts "Enter your password, press ENTER when you're done."
      password = ask('Password (hidden):'.yellow, echo: false)
      (puts "Aborted.".red.bold; exit) if password.empty?


      dataset_count = Dicemypass.check_pwned(password)
      vuln_msg = "Your password appears in #{dataset_count} datasets!".red.bold
      safe_msg = "Your password was not found in a dataset.".green.bold
      puts dataset_count ? vuln_msg : safe_msg
    end

    desc 'about', 'Displays version number and information'
    def about
      puts Dicemypass::BANNER.bold.red
      puts 'version: '.bold + Dicemypass::VERSION.green
      puts 'author: '.bold + 'Keelana'.green
      puts 'homepage: '.bold + 'https://github.com/kchar92/dicemypass'.green
      puts 'learn more: '.bold + 'https://codingdose.info'.green
      puts # extra line, somehow I like them.
    end
  end
end
