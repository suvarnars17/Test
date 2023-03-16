public with sharing class DataController {
    @AuraEnabled(cacheable= true)
   public static List<Account> getAccountDetail(){
    return [SELECT Id,Name FROM Account];
   }
   @AuraEnabled(cacheable= true)
   public static List<Contact> getContactDetail(){
    return [SELECT Id,Name FROM Contact];
   }
}