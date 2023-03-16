import { LightningElement } from 'lwc';

export default class ParentCmp extends LightningElement {
    strContactName ='';

    changeName(event){
        this.strContactName=event.targt.value;
    }
    addContact(event){
        const objChild = this.template.querySelector('c-child-cmp');
        objChild.addContactToList(this.strContactName);
    }
}