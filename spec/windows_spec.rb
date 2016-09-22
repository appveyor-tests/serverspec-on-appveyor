require "serverspec"

set :backend, :cmd
set :os, :family => 'windows'

describe "Some package tests" do
  describe package("AppVeyor Build Agent") do
    it { should be_installed}
  end

  describe service("DHCP Client") do
    it { should be_running }
    it { should have_start_mode("Automatic") }
  end

  describe file("#{ENV['ProgramFiles']}/git/git-bash.exe") do
    it { should exist }
  end

  describe file("#{ENV['ProgramFiles']}/git /") do
    it { should be_directory }
  end
end
