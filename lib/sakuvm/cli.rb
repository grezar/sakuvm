require "optparse"
require "sakuvm/client"

module Sakuvm
  class CLI
    def self.start
      params = ARGV.getopts('h:p:u:', 'host:', 'password:', 'user:', 'insecure')
      client = Sakuvm::Client.new(params)
      vms = client.virtual_hosts
      Sakuvm::Table.display(vms)
    end
  end
end
