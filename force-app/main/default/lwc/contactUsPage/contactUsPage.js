import { LightningElement, wire } from 'lwc';
import Id from '@salesforce/user/Id';
import getLoggedinUserAccountInfo from '@salesforce/apex/ContactUsController.getLoggedinUserAccountInfo';
import getAccountDetail from '@salesforce/apex/CustomListController.getAccountDetail'; 
export default class ContactUsPage extends LightningElement {
    userId = Id;
    IsBDMNull;

    BDMName;
    BDMEmail;
    BDMPhone;

    contactName;
    contactEmail;
    contactPhone;

    connectedCallback(){

    getLoggedinUserAccountInfo()
    .then(result=>{
        console.log('>>>>>>>>>>>>',result.Bool);
           console.log('>>>>>>>>>>>>',result.accounOwnerDetail);
           this.BDMName=result.accounOwnerDetail.API_Name__c;
           this.BDMEmail=result.accounOwnerDetail.Email__c;
           this.BDMPhone=result.accounOwnerDetail.Phone__c;
           this.IsBDMNull=result.Bool;
           console.log('>>>>>>>>>>>>',result.accountContactus);
           this.contactName=result.accountContactus.Label__c;
           this.contactEmail=result.accountContactus.Contact_Us_URL__c;
           this.contactPhone=result.accountContactus.Contact_us__c;


        }).
        catch(error=>{
        console.log('>>>>>>>>>>>>',error);
        })
    }
}