import { LightningElement , track} from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import createAccount from '@salesforce/apex/createAcc.createAccount';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class PracticeCmp extends LightningElement {
    @track isShowModal = false;

    @track name = NAME_FIELD;
    @track industry = INDUSTRY_FIELD;

    rec = {
        Name : this.name,
        Industry : this.industry
    }
    showModalBox() {  
        this.isShowModal = true;
    }

    hideModalBox() {  
        this.isShowModal = false;
    }
    handleNameChange(event) {
        this.rec.Name = event.target.value;
        console.log("name1", this.rec.Name);
    }
    
    handleIndChange(event) {
        this.rec.Industry = event.target.value;
        console.log("Industry", this.rec.Industry);
    }
    saveModalBox(){
        createAccount({ acc : this.rec })
        .then(result => {
            this.message = result;
            this.error = undefined;
            if(this.message !== undefined) {
                this.rec.Name = '';
                this.rec.Industry = '';
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Account created',
                        variant: 'success',
                    }),
                );
                this.isShowModal = false;
            }
            
            console.log(JSON.stringify(result));
            console.log("result", this.message);
        })
        .catch(error => {
            this.message = undefined;
            this.error = error;
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error creating record',
                    message: error.body.message,
                    variant: 'error',
                }),
            );
            console.log("error", JSON.stringify(this.error));
        });
}
    }
