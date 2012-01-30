require 'aqueduct'

module Aqueduct
  module Repository

    def self.included(base)
      Aqueduct.repositories << base
    end

    def initialize(source, current_user)
      @source = source
      @current_user = current_user
    end

    # Returns a list of urls to download files
    def count_files(file_locators, file_type)
      { result: 0, error: "Unknown Repository: #{@source.repository}", file_paths: [], urls: [] }
    end

    # Only For Local repositories.
    def get_file(file_locator, file_type)
      { file_path: '', error: "Unknown Repository: #{@source.repository}" }
    end

    def has_repository?
      { result: false, error: "Unknown Repository: #{@source.repository}" }
    end

    def file_server_available?
      { result: false, error: "Unknown Repository: #{@source.repository}" }
    end

  end
end