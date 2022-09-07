# frozen_string_literal: true

require "hashie"

require_relative "simple_graphql_client/version"
require_relative "simple_graphql_client/response"
require_relative "simple_graphql_client/client"
require_relative "simple_graphql_client/errors/query_error"
require_relative "simple_graphql_client/errors/parser_error"

module SimpleGraphqlClient
  class Error < StandardError; end
  # Your code goes here...
end
