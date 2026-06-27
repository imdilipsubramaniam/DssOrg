import { subscribe , MessageContext} from 'lightning/messageService';
import { LightningElement,wire } from 'lwc';
import COMPONENT_COMMUNICATION_CHANNEL from '@salesforce/messageChannel/componentCommunicationChannel__c'



export default class ComponentB extends LightningElement {

    @wire(MessageContext)
    messageContext;

    receivedMessage="No message received";
    subscription=null;

    connectedCallback(){
        if(!this.subscription){
            this.subscription = subscribe(
                this.messageContext,COMPONENT_COMMUNICATION_CHANNEL,
                (payload)=> this.handleMessage(payload)
            )
        }
    }

    handleMessage(payload){
        this.receivedMessage=payload.message;
    }
}