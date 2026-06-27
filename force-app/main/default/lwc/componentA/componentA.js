import { LightningElement ,wire} from 'lwc';
import COMPONENT_COMMUNICATION_CHANNEL from '@salesforce/messageChannel/componentCommunicationChannel__c';
import { publish,MessageContext } from  'lightning/messageService';
export default class ComponentA extends LightningElement {

    @wire(MessageContext)
    messageContext;

    publishMessage(){
       const inputMsg = this.template.querySelector('[data-id="parent_Message"]').value;
       const payload= {message:inputMsg};
       publish(this.messageContext,COMPONENT_COMMUNICATION_CHANNEL,payload);
}
}