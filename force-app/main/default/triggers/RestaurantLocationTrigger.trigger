trigger RestaurantLocationTrigger on Restaurant_Location__c (before insert,after insert, after update)
{
    new RestaurantLocationTriggerHandler().run();
}