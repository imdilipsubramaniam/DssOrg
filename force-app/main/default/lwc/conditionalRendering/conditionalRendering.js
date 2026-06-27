import { LightningElement } from 'lwc';

export default class ConditionalRendering extends LightningElement {
    //lets do 3 buttons - each button on toggle shows different section - lets do this easy way then try the getters
    button1Setting = false;
    button2Setting =false;
    button3Setting = false;

    handleButton1(event){
        this.button1Setting =true;
        this.button2Setting =false;
        this.button3Setting =false;
    }

    handleButton2(event){
        this.button1Setting =false;
        this.button2Setting =true;
        this.button3Setting =false;
    }

    handleButton3(event){
        this.button1Setting =false;
        this.button2Setting =false;
        this.button3Setting =true;
    }

    handleReset(event){
        this.button1Setting =false;
        this.button2Setting =false;
        this.button3Setting =false;
    }

    
    

}