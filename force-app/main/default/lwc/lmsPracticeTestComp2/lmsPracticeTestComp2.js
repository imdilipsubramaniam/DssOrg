import { LightningElement, wire } from 'lwc';
import {subscribe, MessageContext} from 'lightning/messageService';
import MessageChannel from '@salesforce/messageChannel/practiceMessageChannel__c';

export default class LmsPracticeTestComp2 extends LightningElement {
    recordData;

    @wire(MessageContext)
    messageContext;

    connectedCallback(){
        subscribe(this.messageContext,MessageChannel,(payload)=>{
            this.handlePayload(payload);
            
        })
    }

    handlePayload(payload){
        console.log('Received payload', payload);
        this.recordData = payload.recordData;
    }
}