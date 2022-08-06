@isTest
private class RestaurantLocationTriggerTest {
    
    @isTest
    static void testLivePositiveDateSet() {

        Account parentAccount = new Account();
        parentAccount.Name ='Test account for active Restaurant Locations';
        insert parentAccount;
        Restaurant_Location__c testLocation1 = new Restaurant_Location__c();
        testLocation1.Name = 'Test Location 1';
        testLocation1.Region__c = 'East';
        testLocation1.Status__c = 'Active';
		testLocation1.Account__c=parentAccount.Id;
		testLocation1.Last_Visit_Date__c=Date.parse('7/31/2022');
		testLocation1.Address__c='4, No 25, Tnhb Shoping Cmplx, Luz Church Road, Mylapore,Chennai';
        insert testLocation1;

        Restaurant_Location__c testLocation2 = new Restaurant_Location__c();
        testLocation2.Name = 'Test Location 2';
        testLocation2.Region__c = 'West';
        testLocation2.Status__c = 'Active';
		testLocation2.Account__c=parentAccount.Id;
		testLocation2.Last_Visit_Date__c=Date.parse('8/5/2022');
		testLocation2.Address__c='2, Shri Shrimal House, Station Road, Opp:prashant Hotel., Goregaon (west), Mumbai';
        insert testLocation2;

        Restaurant_Location__c testLocation3 = new Restaurant_Location__c();
        testLocation3.Name = 'Test Inactive Location ';
        testLocation3.Region__c = 'West';
        testLocation3.Status__c = 'Inactive';
		testLocation3.Account__c=parentAccount.Id;
		testLocation3.Last_Visit_Date__c=Date.parse('8/6/2022');
		testLocation3.Address__c='21, Shri Shrimal House, Station Road, Opp:prashant Hotel., Goregaon (west), Mumbai';
        insert testLocation3;
        testLocation3.Last_Visit_Date__c = Date.parse('8/8/2022');
        update testLocation3;
        test.startTest();
        test.stopTest();
    }

    
    @isTest
    static void testLiveNegativeDateSet() {

        Account parentAccount = new Account();
        parentAccount.Name ='Test account for Inactive Restaurant Locations';
        Insert parentAccount;
        Restaurant_Location__c testLocation1 = new Restaurant_Location__c();
        testLocation1.Name = 'Test Location 3';
        testLocation1.Region__c = 'East';
        testLocation1.Status__c = 'Inactive';
		testLocation1.Account__c=parentAccount.Id;
		testLocation1.Last_Visit_Date__c=Date.parse('7/31/2022');
		testLocation1.Address__c='4, No 25, Tnhb Shoping Cmplx, Luz Church Road, Mylapore,Chennai';
        insert testLocation1;

        Restaurant_Location__c testLocation2 = new Restaurant_Location__c();
        testLocation2.Name = 'Test Location 4';
        testLocation2.Region__c = 'West';
        testLocation2.Status__c = 'Inactive';
		testLocation2.Account__c=parentAccount.Id;
		testLocation2.Last_Visit_Date__c=Date.parse('8/5/2022');
		testLocation2.Address__c='2, Shri Shrimal House, Station Road, Opp:prashant Hotel., Goregaon (west), Mumbai';
        insert testLocation2;
        test.startTest();
        System.assertEquals(parentAccount.Last_Location_Visit_Date__c, Null);
        test.stopTest();
    }
}