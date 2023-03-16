public class MyAccountController {
   Public List<Account> accountList {get;set;}
    /*Public List<Account> accountList;
     * public List<Account> getAccountDetails(){
     return accountList; 
    }
    public void setAccountDetails(List<Account> acc){
     this.accountList=acc;
    }*/
    public MyAccountController(){
         accountList = [SELECT id,name,website from Account Limit 100];
    }
}