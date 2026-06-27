import { LightningElement } from 'lwc';

export default class ParentReceivingFromChild extends LightningElement {
    childData;

    handleEvent(event){
        this.childData = event.detail;
    }
}