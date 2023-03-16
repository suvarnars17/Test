global class UpdateParentToChildBatch implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id,Name,Status__c FROM Support_TierA__c]);
    }
     global void execute(Database.BatchableContext bc, List<Support_TierA__c> records){
         Map<ID, Support_TierB__c> parentOpps = new Map<ID, Support_TierB__c>(); 
        List<Id> listIds = new List<Id>();
        System.debug('records'+records);
        for (Support_TierA__c childObj : records) {
            listIds.add(childObj.Support_TierB__c);
            System.debug('listIds'+listIds);
        }
             parentOpps = new Map<Id, Support_TierB__c>([SELECT id,Status__c, Name,(SELECT ID, Name,Status__c FROM Support_TierA__r) FROM Support_TierB__c WHERE ID IN :listIds]);
             
             for (Support_TierA__c quote: records){
                 Support_TierB__c myParentOpp = parentOpps.get(quote.Support_TierB__c);
                 myParentOpp.Status__c = quote.Status__c;
             }
               System.debug('parentOpps'+parentOpps.values());
             update parentOpps.values();

             }   
    global void finish(Database.BatchableContext bc){
        
    }  
}