import { LightningElement } from 'lwc';
import login from '@salesforce/apex/AmazonLoginController.login';
export default class AmazonLoginPage extends LightningElement {
    userName;
    password;
    errorMassage='';
    handleUserName(event){
        this.userName=event.target.value;
    }
    handlePassword(event){
        this.password=event.target.value;
    }
    handleLogin(){
        console.log('handleLogin');
        console.log('userName',this.userName);
        console.log(this.password);
        if(this.userName !=null && this.password !=null){
            login({username:this.userName, password:this.password})
            .then((result)=>{
                this.isError=false;
                     console.log('result',result);
            })
            .catch((error)=>{
                console.log('error',error);
                this.isError=true;
                this.errorMassage=error.body.errorMassage;
            })
        }
    }
}