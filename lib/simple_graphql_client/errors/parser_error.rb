# frozen_string_literal: true

module SimpleGraphqlClient
  module Errors
    class ParserError < StandardError
      attr_reader :error, :response

      def initialize(error, response)
        @error = error
        @response = response
        super(message)
      end

      def message
        "Failed to parse response #{response.body[0..10]}... from #{response.request.inspect}."
      end
    end
  end
end
