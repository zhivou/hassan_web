require_relative '../../lib/assets/gmail_messagger/gmail_helper'

class HardWorker
  include Sidekiq::Worker

  DIR = File.join(File.dirname(__FILE__), "../../tmp/transfer/")

  ##
  # Main trigger
  #
  def perform(params)
    @parameters = params
    create_file
    build_email
    #clear_up
  end

  ##
  # Parses all recorded data into a file
  # for further calculation. tmp/transfer/id_file_name.rb
  #
  def create_file
    file = "#{@parameters['id']}_#{@parameters['updated_at']}_for_calc.txt"
    File.open(DIR + file, 'w') do |f|
      f.write("Calculate with following variables:")
      f.write(@parameters.inspect)
    end
  end

  def build_email
    gmail = GmailHelper.new
    to = @parameters['email']
    data = File.read(DIR + "#{@parameters['id']}_#{@parameters['updated_at']}_for_calc.txt")
    gmail.build_message_template(to, data)
  end

  def clear_up
    File.delete(DIR + "#{@parameters['id']}_#{@parameters['updated_at']}_for_calc.txt")
  end
end
