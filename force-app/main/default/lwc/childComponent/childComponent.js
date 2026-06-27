import { LightningElement,api } from 'lwc';

export default class ChildComponent extends LightningElement {
    @api productList;

    showDetails = false;

    @api handleButtonClick(){
        if(this.showDetails==false){
            this.showDetails = true;
        }else{
            this.showDetails = false;
        }
        
    }

}