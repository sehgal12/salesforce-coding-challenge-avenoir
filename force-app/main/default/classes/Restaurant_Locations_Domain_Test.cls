@isTest
public class Restaurant_Locations_Domain_Test {
    @isTest
    public static void testgetRestaurantLocationById() {
        Account testAccount = new Account(Name = 'testAccount'); 
        insert testAccount;
        String testAccountId = testAccount.Id;
        Restaurant_Location__c testRestaurant = new Restaurant_Location__c();
        Restaurant_Location__c testData = new Restaurant_Location__c(
            Name = 'testData', status__c = 'Active', Account__c = testAccountId, 
            Address__c = 'Dubai', Region__c = 'East', Last_Visit_Date__c = Date.today()
        );
        insert testData;
        Test.startTest();
         testRestaurant = Restaurant_Locations_Domain.getRestaurantLocationById(
           new Set<Id>{testData.Id}
         )[0];
        Test.stopTest();
        System.assertEquals(testRestaurant.Id, testData.Id);
        System.assertEquals(testRestaurant.Status__c, testData.Status__c);
        System.assertEquals(testRestaurant.Account__c, testData.Account__c);
        System.assertEquals(testRestaurant.Last_Visit_Date__c, testData.Last_Visit_Date__c);
    }
}