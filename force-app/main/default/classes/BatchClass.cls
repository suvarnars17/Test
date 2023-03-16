public class BatchClass implements database.Batchable<sobject> {
    public database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator([SELECT id from Opportunity]);
    }
    public void execute(database.BatchableContext bc,List<Opportunity> opps){
        for(Opportunity oppObj:opps){
            oppObj.LeadSource='Web';
        }
        Update opps;
    }
    public void finish(database.BatchableContext bc){
        
    }
}