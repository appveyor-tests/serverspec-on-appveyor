require "serverspec"

set :backend, :cmd
set :os, :family => 'windows'

describe "Some package tests" do
  # AppVeyor Build Agent
  describe package("mypackage") do
    it { should be_installed}
  end

  # DHCP Client
  describe service("mypackage") do
    it { should be_running }
    it { should have_start_mode("Automatic") }
  end

  describe file("#{ENV['ProgramFiles']}/mypackage/git-bash.exe") do
    it { should exist }
  end

  describe file("#{ENV['ProgramFiles']}/mypackage/") do
    it { should be_directory }
  end
end
