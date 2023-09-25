require "sinatra"
require "sinatra/reloader"

get("/") do

  erb(:useless_fact)
end

get("/process_fact") do
  require "http"
  require "json"

  @useless_facts_url = "https://uselessfacts.jsph.pl/api/v2/facts/random"

  @raw_response = HTTP.get(@useless_facts_url)

  @parsed_response = JSON.parse(@raw_response)

  @fact = @parsed_response.fetch("text")


  erb(:process_fact)
end
