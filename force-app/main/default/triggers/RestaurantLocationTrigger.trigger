trigger RestaurantLocationTrigger on Restaurant_Location__c (before insert)
{
    new RestaurantLocationTriggerHandler().run();
}