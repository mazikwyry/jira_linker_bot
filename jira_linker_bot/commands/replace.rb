module JiraLinkerBot
  module Commands
    class Replace < SlackRubyBot::Commands::Base
      scan(/(#{ENV['JIRA_PROJECT_KEY']}-\d{1,4})/) do |client, data, tickets|
        buttons = []
        links = []

        tickets.each do |ticket|
          ticket_number = ticket.first
          link = "#{ENV['JIRA_URL']}browse/#{ticket_number}"

          buttons << {
            type: 'button',
            text: ticket_number,
            url: link
          }
          links << link
        end

        client.web_client.chat_postMessage(
          channel: data.channel,
          as_user: true,
          attachments: [
            {
              fallback: links.join(','),
              actions: buttons
            }
          ]
        )
      end
    end
  end
end
