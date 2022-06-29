public with sharing class RestaurantLocationTriggerHandler extends TriggerHandler {

    public RestaurantLocationTriggerHandler() {
      
    }
    
    public override void beforeInsert() {
      for(Restaurant_Location__c location: (List<Restaurant_Location__c>)trigger.new)
        {
            if(location.Last_Visit_Date__c == null){
                location.Last_Visit_Date__c = Date.today();
            }
        }
    }
  
  }