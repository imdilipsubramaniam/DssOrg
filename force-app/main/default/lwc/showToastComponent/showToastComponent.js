import { LightningElement } from 'lwc';
import createAccount from '@salesforce/apex/createAccountApex.createAccount'
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class ShowToastComponent extends LightningElement {
    accountName;

    handleChange(event){
        this.accountName = event.target.value;

    }

    createAccountRecord(){
        createAccount({accountName : this.accountName})
        .then(()=>{
            console.log('Account created Successfully');
            this.showToast('Success', 'Account created successfully 1', 'success', 'dismissable');
        })
        .catch(error=>{
            this.showToast('Error', 'Please Enter a Valid Account Name', 'error', 'dismissable');
            console.error('Error creating account:' ,error);
            
        })
    }

    showToast(title,message,variant,mode){
        this.dispatchEvent(new ShowToastEvent({
            title : title,
            message : message,
            variant : variant,
            mode : mode
        }));
    }


}