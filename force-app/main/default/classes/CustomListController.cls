public with sharing class CustomListController {
    @AuraEnabled(cacheable= true)
    public static List<Account> getAccountDetail(){
     return [SELECT Id,Name,Type,CustomerPriority__c FROM Account];
    }
}