global with sharing class AmazonLoginController {
   @AuraEnabled
   global static string login(String username,String password){
String homeUrl='https://raagvitech96-dev-ed.my.site.com/amazon/s/';
ApexPages.PageReference pageRef = Site.login(username,password,homeUrl);
return pageRef.getURL();
   }
}