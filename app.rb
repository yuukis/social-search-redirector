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

get '/' do
  erb :index
end

get '/:service' do
  service = params[:service]
  base_url = SEARCH_BASE[service]
  halt 404, "Unknown service: #{service}" unless base_url

  all_words = load_search_words
  words = Array(all_words[service])

  halt 500, "No search words." if words.empty?

  date_query_parts = []
  
  if params[:since]
    date_query_parts << "since:#{params[:since]}_JST"
  end
  
  if params[:until]
    date_query_parts << "until:#{params[:until]}_JST"
  end

  case service
  when 'x'
    query_parts = []
    query_parts.concat(date_query_parts) unless date_query_parts.empty?
    query_parts << words.join(" OR ")
    
    query = query_parts.join(" ")
    q = CGI.escape(query)
    redirect "#{base_url}#{q}", 302
  end
end
