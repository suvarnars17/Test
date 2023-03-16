trigger CaseTrigger on Case (before insert) {
    if(trigger.isInsert && trigger.isBefore){
       // caseHandler.CaseLimitWithinMonth(trigger.new);
    }
}