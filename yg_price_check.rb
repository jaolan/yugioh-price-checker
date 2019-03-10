# This script returns price data for a list of Yugioh cards using the yugiohprices API.
# Check them out at http://yugiohprices.com

require 'rubygems' if RUBY_VERSION < '1.9'
require 'rest_client'

# add your own input and output files.
card_list_file = ""
output_file = ""

File.open(card_list_file, "r") do |f|
  f.each_line do |line|
    #print card num
    puts line

    #build REST string
    restString = "http://yugiohprices.com/api/price_for_print_tag/" + line.delete!("\n")

    #access REST data and print to console
    line_output = RestClient.get restString
    puts line_output

    #write to file
    File.open(output_file, 'a+') { |file| file.puts(line + "\t" + line_output + "\n\n") }

  end
end