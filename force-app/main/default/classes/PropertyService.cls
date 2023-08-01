public with sharing class PropertyService {
    @AuraEnabled(cacheable=true)
    
    public static List<Property__c> getProperties () {
       try {
        List<Property__c> propertyList = [
            SELECT 
            Name, 
            Date_Listed__c,
            Days_On_Market__c,
            Price__c 
            FROM Property__c
            WITH USER_MODE
            ORDER BY Days_On_Market__c
        ];
        return propertyList;
       } catch (Exception ex) {
        throw new AuraHandledException(ex.getMessage());
       } 
    }
}



