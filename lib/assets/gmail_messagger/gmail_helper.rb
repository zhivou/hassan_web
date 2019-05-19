require 'google/apis/gmail_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'

class GmailHelper

  DIR = File.join(File.dirname(__FILE__), "")
  OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'.freeze
  APPLICATION_NAME = DIR + 'carrots01'.freeze
  CREDENTIALS_PATH = DIR + 'credentials.json'.freeze
  TOKEN_PATH = DIR + 'token.yaml'.freeze
  SCOPE = Google::Apis::GmailV1::AUTH_SCOPE

  def authorize
    client_id = Google::Auth::ClientId.from_file(CREDENTIALS_PATH)
    token_store = Google::Auth::Stores::FileTokenStore.new(file: TOKEN_PATH)
    authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
    user_id = 'default'
    credentials = authorizer.get_credentials(user_id)
    if credentials.nil?
      url = authorizer.get_authorization_url(base_url: OOB_URI)
      puts 'Open the following URL in the browser and enter the ' \
           "resulting code after authorization:\n" + url
      code = gets
      credentials = authorizer.get_and_store_credentials_from_code(
          user_id: user_id, code: code, base_url: OOB_URI
      )
    end
    credentials
  end

  def initialize_new_gmail_service
    application_name_string = 'Gmail API Ruby'
    service = Google::Apis::GmailV1::GmailService.new
    service.client_options.application_name = application_name_string
    service.authorization = authorize
    service
  end

  ##
  # Add file attachment to the method. For not we don't have
  # result file yet so sending data as message body
  #
  def build_message_template(send_to, data)
    to = send_to
    subject = "****NO REPLY:Carrots Sender:Test Results"
    message_body = "Results: #{data}"

    message = Google::Apis::GmailV1::Message.new(:raw => "To: #{to}\r\nSubject: #{subject}\r\n\r\n#{message_body}")
    send_message(message, initialize_new_gmail_service)
  end

  def send_message(message_object, service)
    initialize_new_gmail_service.send_user_message("me", message_object)
  end
end