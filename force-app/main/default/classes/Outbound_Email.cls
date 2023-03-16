public class Outbound_Email {
    public void invoke(){
        /*Fetch the Email template*/
        EmailTemplate et=[SELECT id,Name from EmailTemplate where Name= 'Update_Account'];
        /*To whom we can send mail
         * user
         * contact
         * lead
         */
        Contact con=[SELECT id,AccountId from Contact WHERE createdDate =today];
        messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
        msg.setTargetObjectId(con.id);
        msg.setTemplateId(et.id);
        msg.setWhatId(con.AccountId);
        messaging.Email[] emails=new messaging.Email[]{msg};
        messaging.sendEmail(emails);   
    }
}