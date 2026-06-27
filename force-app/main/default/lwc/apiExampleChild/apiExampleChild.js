import { LightningElement , api} from 'lwc';

export default class ApiExampleChild extends LightningElement {

    @api childProperty1;
    @api childProperty2;

    
    @api callChildMethod(){
        this.childProperty2 = "";
    }

    sendMessageToParent(){
        let inputValue= this.template.querySelector('[data-id="child"]').value;
        this.dispatchEvent(new CustomEvent('send',{detail:inputValue}));
    }

}