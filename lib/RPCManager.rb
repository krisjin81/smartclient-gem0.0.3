require 'DSRequest'
require 'DSResponse'

class RPCManager
  @request = nil  
  @model = nil
  def initialize(request=nil, model=nil)
    @request = request
    @model = model
  end  
=begin
  <summary>
      Transforms a object object into a Json. Will setup the serializer with the        
      appropriate converters, attributes,etc.
  </summary>
      <param name="dsresponse">the object object to be transformed to json</param>
      <returns>the created json object</returns>
=end
  def processRequest
    # retrieve the requests with data
   
    req = DSRequest.new(@request, @model)  
    # set the response variable
    res = req.execute
  File.open('kris.txt', 'w') { |file| file.write(res) }
    # safeguard, if was null, create an empty response with failed status
    if res.nil?
      res = DSResponse.new
      res.status=-1
    end                
    return res      
  end
end