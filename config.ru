$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'dotenv'
Dotenv.load

require 'jira_linker_bot'
require 'web'

Thread.abort_on_exception = true

Thread.new do
  begin
    JiraLinkerBot::Bot.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run JiraLinkerBot::Web
