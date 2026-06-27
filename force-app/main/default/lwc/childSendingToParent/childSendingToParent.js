import { LightningElement } from 'lwc';

export default class ChildSendingToParent extends LightningElement {
    childData;

    handleClick(){
        this.childData ="Hi Dilip";
        const event = new CustomEvent('senddata',{detail:this.childData});
        this.dispatchEvent(event);
    }
}