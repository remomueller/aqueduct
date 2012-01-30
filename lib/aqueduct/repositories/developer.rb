require 'aqueduct'

module Aqueduct
  module Repositories
    class Developer
      include Aqueduct::Repository

      # Returns a list of urls to download files
      def count_files(file_locators, file_type)
        error = ''
        result = 0
        file_paths = []
        url_paths = []
        file_locators.each do |file_locator|
          file_locator = file_locator.to_s.gsub(/[\/*]/, '') # Don't allow wild cards or subfolders
          file_type = file_type.to_s.gsub(/[\/*]/, '')       # Don't allow wild cards or subfolders
          matching_file_names = Dir.glob(File.join(Rails.root, 'test', 'support', 'repositories', "#{file_locator}#{file_type}"))
          matching_file_names.each do |file_name|
            file_paths << file_name unless file_name.blank?
            url_paths << SITE_URL + "/sources/#{@source.id}/download_file?file_locator=#{file_locator}&file_type=#{file_type}&fn=#{file_name.split('/').last}" unless file_name.blank?
          end
        end

        { result: url_paths.size, error: error, file_paths: file_paths, urls: url_paths }
      end

      # Only For Local repositories.
      def get_file(file_locator, file_type)
        result_hash = count_files([file_locator], file_type)
        { file_path: result_hash[:file_paths].first.to_s, error: result_hash[:error] }
      end

      def has_repository?
        { result: true, error: "" }
      end

      def file_server_available?
        { result: true, error: "" }
      end
    end
  end
end