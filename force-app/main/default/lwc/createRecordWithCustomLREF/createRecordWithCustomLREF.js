import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation';
import {showToastEvent} from 'lightning/platformShowToastEvent';

export default class CreateRecordWithCustomLREF extends NavigationMixin(LightningElement) {

    recordId;

    handleError(event){
        console.log('Error',event.detail);
    }

    handleSubmit(event){
        console.log('Submit',event.detail);
    }

    handleSuccess(event){
        //alert('Record created successfully id : ', event.detail.id);
        console.log('DS',event.detail.id);
        this.recordId = event.detail.id;
        this.callNavigationMixin();
      
    }

    handleLoad(event){
        console.log('Load',event.detail);
    }

    
    callNavigationMixin(){
        this[NavigationMixin.Navigate]({
            type :'standard__recordPage',
            attributes:{
                recordId : this.recordId,
                objectApiName: 'Case',
                actionName :'view'
            }
        })
    }
}