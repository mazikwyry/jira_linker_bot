require 'sinatra/base'

module JiraLinkerBot
  class Web < Sinatra::Base
    get '/' do
      'Czego tu szukasz?'
    end
  end
end
