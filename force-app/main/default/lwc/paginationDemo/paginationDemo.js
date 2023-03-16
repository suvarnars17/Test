import { LightningElement, wire, track} from 'lwc';
import getAccountDetail from '@salesforce/apex/DataController.getAccountDetail'
import getContactDetail from '@salesforce/apex/DataController.getContactDetail';
export default class PaginationDemo extends LightningElement {

listofAccount;
listofContact;

@wire(getAccountDetail)
wiredAccount({data,error}){
    if(data){
    this.listofAccount=data;
    console.log('data',this.listofAccount)
    }
    else if(error){
        console.error(error);
    }
}

@wire(getContactDetail)
wiredContact({data,error}){
    if(data){
    this.listofContact=data;
    }
    else if(error){
        console.error(error);
    }
}
}