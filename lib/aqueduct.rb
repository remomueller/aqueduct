require 'aqueduct/repository'
require 'aqueduct/wrapper'
require 'aqueduct/version'

module Aqueduct
  module Repositories
    autoload :Developer, 'aqueduct/repositories/developer'
  end

  module Wrappers
    autoload :Developer, 'aqueduct/wrappers/developer'
  end

  autoload :Repository, 'aqueduct/repository'
  autoload :Wrapper, 'aqueduct/wrapper'

  def self.repositories
    @@repositories ||= []
  end

  def self.wrappers
    @@wrappers ||= []
  end

  class Builder
    def self.repository(source, user)
      klass = source.repository[0].upcase + source.repository[1..-1]

      begin
        Aqueduct::Repositories.const_get(klass).new(source, user)
      rescue NameError
        raise LoadError, "Please add aqueduct-#{source.repository} to your Gemfile."
      end
    end

    def self.wrapper(source, user)
      klass = source.wrapper[0].upcase + source.wrapper[1..-1]

      begin
        Aqueduct::Wrappers.const_get(klass).new(source, user)
      rescue NameError
        raise LoadError, "Please add aqueduct-#{source.wrapper} to your Gemfile."
      end
    end
  end

end
