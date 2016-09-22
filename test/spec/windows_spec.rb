require "serverspec"

set :backend, :cmd
set :os, :family => 'windows'

describe "Some package tests" do
  describe package("mypackage") do
    it { should be_installed}
  end

  describe service("mypackage") do
    it { should be_running }
    it { should have_start_mode("Automatic") }
  end

  describe file("#{ENV['ProgramFiles']}/a/file") do
    it { should exist }
  end

  describe file("#{ENV['ProgramFiles']}/a/directory/") do
    it { should be_directory }
  end
end
