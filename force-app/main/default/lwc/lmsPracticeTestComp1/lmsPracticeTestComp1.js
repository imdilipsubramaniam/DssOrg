import { LightningElement, wire } from 'lwc';
import {publish, MessageContext } from 'lightning/messageService';
import MessageChannel from '@salesforce/messageChannel/practiceMessageChannel__c';

export default class LmsPracticeTestComp1 extends LightningElement {
    recordData;

    handleChange(event){
        console.log('lms1',event.target.value);
        this.recordData = event.target.value;
    }

    @wire(MessageContext)
    messageContext;

    sendToSibiling(){
        const payload ={recordData : this.recordData};
        publish(this.messageContext,MessageChannel,payload);
        console.log('published', JSON.stringify(payload));
    }
}