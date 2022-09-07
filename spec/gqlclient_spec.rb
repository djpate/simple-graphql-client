# frozen_string_literal: true

RSpec.describe SimpleGraphqlClient do
  it "has a version number" do
    expect(SimpleGraphqlClient::VERSION).not_to be nil
  end

  it "handles parsing errors" do
    raw_response = double(:response, body: "foobar", request: nil)
    expect(RestClient).to receive(:post).and_return(raw_response)
    client = SimpleGraphqlClient::Client.new(url: "http://gogle.com")
    response = client.query(gql: "{}")
    expect { response.body }.to raise_error(SimpleGraphqlClient::Errors::ParserError)
  end

  it "handles proper response" do
    raw_response = double(:response, body: { data: { foo: :bar } }.to_json, request: nil)
    expect(RestClient).to receive(:post).and_return(raw_response)
    client = SimpleGraphqlClient::Client.new(url: "http://gogle.com")
    response = client.query(gql: "{}")
    expect(response.body).to eq({ "foo" => "bar" })
  end

  it "handles response errors" do
    raw_response = double(:response, body: { errors: [{ message: "something went wrong" }] }.to_json, request: nil)
    expect(RestClient).to receive(:post).and_return(raw_response)
    client = SimpleGraphqlClient::Client.new(url: "http://gogle.com")
    response = client.query(gql: "{}")
    expect { response.body }.to raise_error(SimpleGraphqlClient::Errors::QueryError, "1 error(s) found in your query: something went wrong")
  end
end
