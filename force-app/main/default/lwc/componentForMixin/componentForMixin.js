import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation';

export default class ComponentForMixin extends NavigationMixin(LightningElement) {
    
    openRecord(){
        try{
            this[NavigationMixin.Navigate]({
            type:'standard__recordPage',
            attributes:{
                recordId:'001WU00000uipTWYAY',
                objectApiName:'Account',
                actionName:'view'
                

            }
        });
        }
        catch(error){
            console.error('Error navigating to record page:', error);
        }
        
    }

}