trigger UpdateBandC on Support_TierA__c (After Insert,After Update) {
    If(Trigger.IsAfter && Trigger.IsUpdate){
        UpdateBAndCObjectHandler.UpdateRecords(Trigger.New);
    }
     If(Trigger.IsAfter && Trigger.IsInsert){
        UpdateBAndCObjectHandler.UpdateRecords(Trigger.New);
    }
}