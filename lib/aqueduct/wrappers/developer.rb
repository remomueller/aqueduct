require 'aqueduct'

module Aqueduct
  module Wrappers
    class Developer
      include Aqueduct::Wrapper

      def initialize(source, current_user)
        @source = source
        @current_user = current_user
        @db_connection = true
      end

      def disconnect
        true
      end

      def query(sql_statement)
        [[[1,2,3,4],[5,nil,7,8]],2]
      end

      def sql_codes
        { text: 'text', numeric: 'numeric', open: '[', close: ']' }
      end

      # Returns the Connection Status of the underlying data source.
      def connected?
        { result: true, error: "" }
      end

      # Returns an array of tables
      def tables
        { result: ['table'], error: "" }
      end

      # Returns an array of columns for a given table
      def table_columns(table)
        if table.blank?
          { columns: [], error: "No Table Name Provided" }
        else
          { columns: (1..50).collect{|i| { column: "column#{i}" }} + [{ column: "gender" }], error: "" }
        end
      end

      def get_all_values_for_column(table, column)
        values = []
        case column when 'gender'
          values = ['m', 'f', nil, 'm', 'm', 'f']
        when 'column4'
          values = [20, 21, 22, 23, 27, 28]
        end
        { values: values, error: "" }
      end

      def column_values(table, column)
        values = []
        values_hash = self.get_all_values_for_column(table, column)
        values = values_hash[:values].uniq
        { result: values, error: values_hash[:error] }
      end

      def count(query_concepts, conditions, tables, join_conditions, concept_to_count)
        result = (conditions == '1 = 1') ? 100 : 0
        { result: result, error: "" }
      end

      def concept_tables(query_concept)
        { result: ['table'], error: "" }
      end

      def conditions(query_concepts)
        conditions = (query_concepts.size > 0) ? '1 = 1' : '1 = 0'
        { conditions: conditions, error: "" }
      end
    end
  end
end