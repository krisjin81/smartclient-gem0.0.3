require 'DataSource'
class DSRequest
    attr_accessor :dataSource, :operationType, :startRow, :endRow, :textMatchStyle, :data, :sortBy, :oldValues
    
    @dataSource = nil
    @operationType = nil
    @startRow = nil
    @endRow = nil
    @textMatchStyle = nil
    @componentId = nil
    @data = nil             
    @sortBy = nil
    @oldValues = nil
           
    @@obj = nil      
    def initialize(data, model)
      @componentId = data[:componentId]
      @dataSource = data[:dataSource]
      @operationType = data[:operationType]
      @startRow = data[:startRow]
      @endRow = data[:endRow]
      @textMatchStyle = data[:textMatchStyle]
      @data = data[:data]
      @sortBy = data[:sortBy]
      @oldValues = data[:oldValues]
      
      @@obj = model
    end 
    
    def execute
      ds = DataSource.new(@dataSource, @@obj)
      if ds.nil?
        return nil
      else
        return ds.execute(self)
      end
    end
end

