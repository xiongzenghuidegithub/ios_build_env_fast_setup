RVM:=$(shell command -v rvm 2>/dev/null)
RUBY:=$(shell command -v ruby 2>/dev/null)
HOMEBREW:=$(shell command -v brew 2>/dev/null)
BUNDLER:=$(shell command -v bundle 2>/dev/null)

default: setup

# print executable path
pep:
	$(info RVM = $(RVM))
	$(info RUBY = $(RUBY))
	$(info HOMEBREW = $(HOMEBREW))
	$(info BUNDLER = $(BUNDLER))
	$(info [ok] print executable path)

# export path
exph:
	source ~/.bash_profile
	$(info [ok] source bash profile)

pre_setup: pep exph
	$(info [ok] pre setup finish)

tasks:=pre_setup
tasks+=check_for_ruby
tasks+=check_for_homebrew
tasks+=update_homebrew
tasks+=install_carthage
tasks+=install_bundler_gem
tasks+=install_ruby_gems
tasks+=install_carthage_dependencies
tasks+=install_cocoapods

setup:  $(tasks)
	$(info [ok] all setup finish)

setup_with_unit_test: \
	setup \
	unit_test

check_for_ruby:
	$(info Checking for Ruby ...)

ifeq ($(RUBY),)
	$(error Ruby is not installed)
endif

# Check if Homebrew is available
check_for_homebrew:
	$(info Checking for Homebrew ...)

ifeq ($(HOMEBREW),)
	$(error Homebrew is not installed)
endif

# Update Homebrew
update_homebrew:
	$(info Update Homebrew ...)
#	brew update

# Install Bundler Gem
install_bundler_gem:
	$(info Checking and install bundler ...)
# ifeq ($(BUNDLER),)
# 	gem install bundler -v '~> 1.16'
# else
# 	gem update bundler '~> 1.16'
# endif

# Install Ruby Gems
install_ruby_gems:
	$(info Install RubyGems ...)
#	bundle install

# Install Cocopods dependencies
install_cocoapods:
	$(info Install Cocoapods ...)
#	pod install

# Install Carthage
install_carthage:
	$(info Install Carthage ...)
# brew unlink carthage || true
# brew install carthage
# brew link --overwrite carthage

# Install Carthage dependencies
install_carthage_dependencies:
	$(info Install Carthage Dependencies ...)
# carthage bootstrap --platform ios --cache-builds

# Run fastlane unit tests
unit_test:
	$(info Run Unittests ...)
# bundle exec fastlane test
