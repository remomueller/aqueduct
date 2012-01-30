require 'aqueduct'

module Aqueduct
  module Wrapper

    def self.included(base)
      Aqueduct.wrappers << base
    end

    def initialize(source, current_user)
      @source = source
      @current_user = current_user
      @db_connection = nil
    end

    def connect
      @db_connection
    end

    def disconnect
      true
    end

    def query(sql_statement)
      [[],0]
    end

    def use_sql?
      true
    end

    def sql_codes
      { text: '', numeric: '', open: '', close: '' }
    end

    # Returns the Connection Status of the underlying data source.
    def connected?
      { result: false, error: "Unknown Wrapper: #{@source.wrapper}" }
    end

    # Returns an array of tables
    def tables
      { result: [], error: "Unknown Wrapper: #{@source.wrapper}" }
    end

    # Returns an array of columns for a given table
    def table_columns(table)
      { columns: [], error: "Unknown Wrapper: #{@source.wrapper}" }
    end

    def get_all_values_for_column(table, column)
      { values: [], error: "<span style='vertical-align:middle'><img height='13' width='13' align='absmiddle' src='#{SITE_URL}/assets/contour/cross.png' alt='warning' /></span> Unknown Wrapper: #{@source.wrapper}" }
    end

    def column_values(table, column)
      { result: [], error: "Unknown Wrapper: #{@source.wrapper}" }
    end

    def count(query_concepts, conditions, tables, join_conditions, concept_to_count)
      { result: 0, error: "Unknown Wrapper: #{@source.wrapper}" }
    end

    def external_concepts(folder = '', search_term = '')
      { result: [], error: '' }#, error: "Unknown Wrapper: #{@source.wrapper}"}
    end

    def external_concept_information(external_key = '')
      { result: {}, error: "Unknown Wrapper: #{@source.wrapper}" }
    end

    def concept_tables(query_concept)
      { result: [], error: "Unknown Wrapper: #{@source.wrapper}" }
    end

    def conditions(query_concepts)
      { conditions: '', error: "Unknown Wrapper: #{@source.wrapper}" }
    end

  end
end