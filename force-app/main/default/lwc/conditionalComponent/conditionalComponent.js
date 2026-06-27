import { LightningElement } from 'lwc';

export default class ConditionalComponent extends LightningElement {
    isvisible=true;
    show_hide(){
        if(this.isvisible){
            this.isvisible=false;
        }
        else{
            this.isvisible=true;
        }
}
}