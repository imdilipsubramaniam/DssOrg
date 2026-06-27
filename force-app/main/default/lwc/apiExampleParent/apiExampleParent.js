import { LightningElement } from 'lwc';

export default class ApiExampleParent extends LightningElement {

    childMessage="No message received";

    setValue() {
        let inputvalue = this.template.querySelector('lightning-input').value;
        this.template.querySelector('c-api-example-child').childProperty2 = inputvalue;
    }

    emptyChildProperty(){
        //this actually calls the child method from the child component from the parent
        this.template.querySelector('c-api-example-child').callChildMethod();
    }

    storeMessage(event){
        console.log(event.detail);
        this.childMessage=event.detail;
    }
}