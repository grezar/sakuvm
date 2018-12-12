require "optparse"
require "sakuvm/client"

module Sakuvm
  class CLI
    def self.start
      params = ARGV.getopts('h:p:u:', 'host:', 'password:', 'user:', 'insecure')
      puts params
    end
  end
end
