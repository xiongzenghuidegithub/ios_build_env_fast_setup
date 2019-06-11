HOMEBREW:=$(shell command -v brew 2>/dev/null)
RVM:=$(shell command -v rvm 2>/dev/null)
RUBY:=$(shell command -v ruby 2>/dev/null)
BUNDLER:=$(shell command -v bundle 2>/dev/null)

RUBYVERSION:=2.6.0

tasks:=pre_setup
tasks+=check_for_rvm
tasks+=check_for_ruby
tasks+=check_for_homebrew
# tasks+=install_carthage
# tasks+=install_bundler_gem
# tasks+=install_ruby_gems
# tasks+=install_carthage_dependencies
# tasks+=install_cocoapods

default: setup

pep:
	$(info RVM = $(RVM))
	$(info RUBY = $(RUBY))
	$(info HOMEBREW = $(HOMEBREW))
	$(info BUNDLER = $(BUNDLER))
	$(info [ok] print executable path)

exph:
	source ~/.bash_profile
	$(info [ok] source bash profile)

pre_setup: pep exph
	$(info [end] pre_setup)

setup: $(tasks)
	$(info [end] setup)

setup_with_unit_test: setup unit_test
	$(info [end] setup_with_unit_test)

check_for_rvm:
	$(info [begin] Checking for RVM)
ifeq ($(RVM),)
	$(warning RVM is not installed)
	$(info installing RVM ...)
#	gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
	curl -L https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s stable
	$(info installed RVM)
	source ~/.rvm/scripts/rvm
	$(info source ~/.rvm/scripts/rvm)
#	echo "ruby_url=https://cache.ruby-china.org/pub/ruby" > ~/.rvm/user/db
else
	$(info [ok] RVM is installed)
endif

check_for_ruby:
	$(info [begin] Checking for Ruby)
ifeq ($(RUBY),)
	$(warning Ruby is not installed)
	rvm install $(RUBYVERSION)
	$(info rvm installed ruby version: $(RUBYVERSION))
	rvm use $(RUBYVERSION) --default
	$(info rvm use ruby version: $(RUBYVERSION))
else
# FIXME: 判断 ruby version 是否是 2.6.0
	$(info [ok] Ruby is installed)
endif

check_for_homebrew:
	$(info [begin] Checking for Homebrew)
ifeq ($(HOMEBREW),)
	$(warning Homebrew is not installed)
	$(info installing Homebrew ...)
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	$(warning Homebrew is installed)
endif
	$(info [ok] Checking for Homebrew)

install_bundler_gem:
	$(info Checking and install bundler ...)
ifeq ($(BUNDLER),)
	gem install bundler -v '~> 1.17.2'
else
	gem update bundler '~> 1.17.2'
endif

install_ruby_gems:
	$(info Install RubyGems ...)
#	bundle install

install_cocoapods:
	$(info Install Cocoapods ...)
#	pod install

install_carthage:
	$(info Install Carthage ...)
# brew unlink carthage || true
# brew install carthage
# brew link --overwrite carthage

install_carthage_dependencies:
	$(info Install Carthage Dependencies ...)
# carthage bootstrap --platform ios --cache-builds

unit_test:
	$(info Run Unittests ...)
# bundle exec fastlane test
