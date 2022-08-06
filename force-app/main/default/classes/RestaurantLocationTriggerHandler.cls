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

    public override void afterInsert() {
      //System.debug('running in afterInsert');
      Set<id> AccountIDSet = new Set<id>();
      List<Account> listOfAccountToUpdate = new List<Account>();
      for(Restaurant_Location__c location: (List<Restaurant_Location__c>)trigger.new)
        {
            if(location.Status__c == 'Active' && location.Account__c != Null){
              AccountIDSet.add(location.Account__c);
            }
        }
        for (Account currentAccount: [
          SELECT
            Id,
            Last_Location_Visit_Date__c,
            (
                SELECT 
                	Id,
                	Last_Visit_Date__c
                FROM
                	Restaurant_Locations__r
            )
          FROM
            Account
          WHERE
            ID
          IN : AccountIDSet
        ]) {
          Date latestDate =currentAccount.Restaurant_Locations__r[0].Last_Visit_Date__c;
            for (Restaurant_Location__c current:currentAccount.Restaurant_Locations__r){
                if(current.Last_Visit_Date__c > latestDate){
                    latestDate = current.Last_Visit_Date__c;
                }
            }
           System.debug('Latest Date: '+latestDate);
          currentAccount.Last_Location_Visit_Date__c = latestDate;
          listOfAccountToUpdate.add(currentAccount);
        }
    if(listOfAccountToUpdate.size() > 0)   {
        update listOfAccountToUpdate;
      }  
    }
    
    public override void afterUpdate()  {
      Set<id> AccountIDSet = new Set<id>();
      List<Account> listOfAccountToUpdate = new List<Account>();
      for(Restaurant_Location__c location: (List<Restaurant_Location__c>)trigger.new)
        {
            if(location.Status__c == 'Active' && location.Account__c != Null){
              AccountIDSet.add(location.Account__c);
            }
        }
        for (Account currentAccount: [
          SELECT
            Id,
            Last_Location_Visit_Date__c,
            (
                SELECT 
                	Id,
                	Last_Visit_Date__c
                FROM
                	Restaurant_Locations__r
            )
          FROM
            Account
          WHERE
            ID
          IN : AccountIDSet
        ]) {
          Date latestDate =currentAccount.Restaurant_Locations__r[0].Last_Visit_Date__c;
            for (Restaurant_Location__c current:currentAccount.Restaurant_Locations__r){
                System.debug('current.Last_Visit_Date__c: ' + current.Last_Visit_Date__c);
                if(current.Last_Visit_Date__c > latestDate){
                    latestDate = current.Last_Visit_Date__c;
                }
            }
          currentAccount.Last_Location_Visit_Date__c = latestDate;
          listOfAccountToUpdate.add(currentAccount);
        }
    if(listOfAccountToUpdate.size() > 0)   {
        update listOfAccountToUpdate;
      }  
    }
  
  }