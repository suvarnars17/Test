public class UpdateBAndCObjectHandler {
    
    public static void UpdateRecords(List<Support_TierA__c> lstOfArecords){
        
        Map<ID, Support_TierB__c> parentOpps = new Map<ID, Support_TierB__c>(); //Making it a map instead of list for easier lookup
        List<Id> listIds = new List<Id>();
        System.debug('lstOfArecords'+lstOfArecords);
        for (Support_TierA__c childObj : lstOfArecords) {
            listIds.add(childObj.Support_TierB__c);
            System.debug('listIds'+listIds);
        }
             parentOpps = new Map<Id, Support_TierB__c>([SELECT id,Status__c, Name,(SELECT ID, Name,Status__c FROM Support_TierA__r) FROM Support_TierB__c WHERE ID IN :listIds]);
             
             for (Support_TierA__c quote: lstOfArecords){
                 Support_TierB__c myParentOpp = parentOpps.get(quote.Support_TierB__c);
                 myParentOpp.Status__c = quote.Status__c;
             }
               System.debug('parentOpps'+parentOpps.values());
             update parentOpps.values();

             }
}