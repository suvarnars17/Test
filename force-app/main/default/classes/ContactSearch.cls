public class ContactSearch {
    
    Public static List<Contact> searchForContacts(String lName, String mCode){
        List<Contact> qContact = [select id, firstName, lastName, phone from contact
                                  where lastName =: lName AND MailingPostalCode =: mCode ];
        return qContact;      
    }
}