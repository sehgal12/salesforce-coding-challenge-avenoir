public with sharing class Restaurant_Locations_Domain {

    public static List<Restaurant_Location__c> getRestaurantLocationById(Set<Id> restaurantId) {
        return [
            SELECT
                Id,
                Account__c,
                Last_Visit_Date__c,
                Status__c
            FROM
                Restaurant_Location__c
            WHERE
                Id = :restaurantId
        ];
    }
}