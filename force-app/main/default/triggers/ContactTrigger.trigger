trigger ContactTrigger on Contact (after insert,after Update,after delete) {
    set<Id> setOfIds = new set<Id>();
    if(Trigger.isInsert){
        for(Contact con:trigger.new){
            setOfIds.add(con.AccountId);
        }
    }
     if(Trigger.isUpdate && trigger.IsDelete){
        for(Contact con:trigger.new){
            setOfIds.add(con.AccountId);
        }
    }
    List<Account> lstOfAcc=new List<Account>();
    for(Account acc:[SELEct id,noofContacts__c ,(select id from contacts) from Account WHERE id IN:setOfIds]){
        Account accobj=new Account();
        accobj.Id=acc.Id;
        accobj.noofContacts__c=acc.contacts.size();
        lstOfAcc.add(accobj);
    }
    Update lstOfAcc;
}