require "rbvmomi"

module Sakuvm
  class Client
    attr_reader :host, :user, :password, :insecure

    def initialize(params = {})
      @host = params["host"]
      @user = params["user"]
      @password = params["password"]
      @insecure = params["insecure"]
    end

    def esxi_host
      vim.serviceContent.rootFolder.childEntity[0].hostFolder.childEntity[0].host[0]
    end

    def virtual_hosts
      esxi_host.vm.map do |vm|
        {
          hostname: vm.name,
          ip_addr: vm.guest.ipAddress,
          cpu: vm.summary.quickStats.overallCpuUsage,
          memory: vm.summary.quickStats.hostMemoryUsage
        }
      end
    end

    private

    def vim
      @vim ||= RbVmomi::VIM.connect(host: host, user: user, password: password, insecure: insecure)
    end
  end
end
