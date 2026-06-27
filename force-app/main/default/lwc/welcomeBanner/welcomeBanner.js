import { LightningElement } from 'lwc';

export default class WelcomeBanner extends LightningElement {
    firstName ='';
    lastName= '';
    
    handleChange(event){
        const field= event.target.name;
        if(field === 'firstName'){
            this.firstName = event.target.value;
        }else if(field === 'lastName'){
            this.lastName = event.target.value;
        }
    }

    get upperCasedName(){
        return `${this.firstName} ${this.lastName}`.toUpperCase();
    }
}