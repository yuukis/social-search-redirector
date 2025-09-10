require 'sinatra'
require 'yaml'
require 'cgi'

WORDS_FILE = 'search_words.yml'

SEARCH_BASE = {
  'x' => 'https://x.com/search?q='
}

def load_search_words
  return {} unless File.exist?(WORDS_FILE)
  YAML.load_file(WORDS_FILE) || {}
end

get '/:service' do
  service = params[:service]
  base_url = SEARCH_BASE[service]
  halt 404, "Unknown service: #{service}" unless base_url

  all_words = load_search_words
  words = Array(all_words[service])

  halt 500, "No search words." if words.empty?

  case service
  when 'x'
    query = words.join(" OR ")
    q = CGI.escape(query)
    redirect "#{base_url}#{q}", 302
  end
end
