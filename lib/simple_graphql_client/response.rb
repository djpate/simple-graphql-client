# frozen_string_literal: true

require "rest_client"
require "json"

module SimpleGraphqlClient
  class Response
    attr_reader :raw_response

    def initialize(raw_response)
      @raw_response = raw_response
    end

    def body
      parsed_body = Hashie::Mash.new(JSON.parse(raw_response.body))
      raise SimpleGraphqlClient::Errors::QueryError, parsed_body.errors if parsed_body.errors

      parsed_body.data
    rescue JSON::ParserError => e
      raise SimpleGraphqlClient::Errors::ParserError.new(e, raw_response)
    end

    def errors
      response_body
    end
  end
end
