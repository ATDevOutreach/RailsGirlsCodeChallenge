require './AfricasTalkingGateway'
# Specify your login credentials
username = "trial-error";
apikey   = "29f7557bfacfe4335ea850fc3fe258b7f70064d069a014e39d5d2eece16659a9";
# Specify the numbers that you want to send to in a comma-separated list
# Please ensure you include the country code (+254 for Kenya in this case, +256 for Uganda)
to      = "+254711903303,+254739262425";
# And of course we want our recipients to know what we really do
message = "Heeeyy Geeetttyyy!!!!!"
# Create a new instance of our awesome gateway class
gateway = AfricasTalkingGateway.new(username, apikey)
# Any gateway error will be captured by our custom Exception class below,
# so wrap the call in a try-catch block
begin
  # Thats it, hit send and we'll take care of the rest.
  reports = gateway.sendMessage(to, message)

  reports.each {|x|
    # status is either "Success" or "error message"
    puts 'number=' + x.number + ';status=' + x.status + ';messageId=' + x.messageId + ';cost=' + x.cost
  }
rescue AfricasTalkingGatewayException => ex
  puts 'Encountered an error: ' + ex.message
end
