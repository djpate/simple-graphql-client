# frozen_string_literal: true

require "rest_client"
require "json"

module SimpleGraphqlClient
  class Client
    def initialize(url:, &block)
      @url = url
      @options = block
    end

    def query(gql:, variables: {})
      response = RestClient.post(@url, {
        query: gql,
        variables: variables
      }.to_json, request_options)
      handle_response(JSON.parse(response.body))
    end

    private

    def request_options
      base_options = { content_type: :json }
      options = @options ? @options.call : {}
      base_options.merge(options)
    end

    def handle_response(body)
      raise SimpleGraphqlClient::Errors::QueryError, body["errors"] if body.key?("errors")

      body["data"]
    end
  end
end
