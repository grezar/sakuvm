require "optparse"
require "sakuvm/client"
require "sakuvm/table"

module Sakuvm
  class CLI
    def self.start
      params = ARGV.getopts('h:p:u:', 'host:', 'password:', 'user:', 'insecure')
      client = Sakuvm::Client.new(params)
      esxi_host = client.esxi_host.name
      vms = client.virtual_hosts
      Sakuvm::Table.display(esxi_host, vms)
    end
  end
end
