public class AccountCalculator {
    @future
    public static void futureMethod(List<Id> accIds){
        List<Account> accList = [SELECT id, (SELECT id from contacts)
                                 FROM Account 
                                 WHERE id IN: accIds];
        for(Account acc:accList){
            acc.noofContacts__c=acc.contacts.size();
        }
        if(!accList.isEmpty()){
            update accList;  
        }
    } 
 }