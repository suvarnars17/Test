public with sharing class ContactUsController {
    public class wrapContactUsDetail{
        @AuraEnabled
        @TestVisible
        public Custom_BDM_Assignment__mdt accounOwnerDetail;
        @AuraEnabled
        @TestVisible
        public List<Sobject> accountContactus;
        @AuraEnabled
        @TestVisible
        public Boolean Bool;
        public wrapContactUsDetail(Custom_BDM_Assignment__mdt accounOwnerDetail, List<Sobject> accountContactus, Boolean Bool){
            this.accounOwnerDetail = accounOwnerDetail;
            this.accountContactus = accountContactus;
            this.Bool = Bool;
        }
    }
    
    @AuraEnabled 
    public static wrapContactUsDetail getLoggedinUserAccountInfo(){
       
     String loggedInContactId='';
     String UWTeamAssignment='';
     Custom_BDM_Assignment__mdt UWDetail;
     for(User userObj : [SELECT Id, ContactId FROM User 
                         WHERE Id =:userInfo.getUserId() LIMIT 1]){
                             loggedInContactId =userObj.ContactId;
                System.debug('loggedInContactId'+loggedInContactId);             
                         }
     if(loggedInContactId != '' || loggedInContactId != null){
         UWTeamAssignment = [SELECT ID, BDM_Assignment__c 
                             FROM Contact 
                             WHERE Id =: loggedInContactId].BDM_Assignment__c;
         }
          System.debug('UWTeamAssignment'+ UWTeamAssignment); 
        if(UWTeamAssignment != null){
         for(Custom_BDM_Assignment__mdt obj : [SELECT ID ,API_Name__c,Name__c, Email__c,Phone__c
                                            FROM Custom_BDM_Assignment__mdt 
                                            WHERE API_Name__c =: UWTeamAssignment LIMIT 1]){
                                                 System.debug('obj'+obj);
                                                UWDetail =  obj;
                                                 System.debug('UWDetail'+UWDetail);
                                            }
        }

        List<Sobject> lstOfFields =  new List<Sobject>();
        for(Contact_US_info__mdt obj : [SELECT ID,DeveloperName,Label__c, Order_Number__c,Contact_us__c,Contact_Us_URL__c
                                               FROM Contact_US_info__mdt ORDER BY Order_Number__c ASC]){
                                                   lstOfFields.add(obj);           
                                               }
        if(UWDetail != null ){
            return new wrapContactUsDetail(UWDetail, lstOfFields, true);
        }else{
            return new wrapContactUsDetail(null, lstOfFields, false);
        }
    }
}
