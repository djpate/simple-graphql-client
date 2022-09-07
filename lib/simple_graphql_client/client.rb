# frozen_string_literal: true

require "rest_client"
require "json"

module SimpleGraphqlClient
  class Client
    attr_reader :options

    def initialize(url:, &block)
      @url = url
      @request_options = block
    end

    def query(gql:, variables: {})
      response = RestClient.post(@url, {
        query: gql,
        variables: variables
      }.to_json, request_options)
      Response.new(response)
    end

    private

    def request_options
      base_options = { content_type: :json }
      options = @request_options ? @request_options.call : {}
      base_options.merge(options)
    end
  end
end
