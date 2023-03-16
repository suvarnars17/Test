public class AccountHandler {
    public static Account insertNewAccount(String accName)
    {
        Account objAccount = new Account(Name = accName);
        try
        {
            insert objAccount;
            System.debug('Account name is '+ objAccount.Name);
            return objAccount;   
        }
        catch(exception e)
        {
            return null;
        }
    }
}