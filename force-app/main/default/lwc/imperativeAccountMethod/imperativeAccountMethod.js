import { LightningElement } from 'lwc';
import accountRecordsToDisplay from '@salesforce/apex/imperativeAccountClass.accountRecordsToDisplay';

export default class ImperativeAccountMethod extends LightningElement {
    recordsToDisplay=[];
    countOfRecords=5;;

    connectedCallback(){
        accountRecordsToDisplay({count: this.countOfRecords}).then(response=>{
            console.log("Response using imperative approach",response);
            this.recordsToDisplay=response;
        }).catch(error=> {
            console.log("Error",error);
        })
}

    setCount(event){
        console.log("Value",event.target.value);
        let inputRecords = event.target.value;
        if (inputRecords== "") return;
        this.countOfRecords = inputRecords;
        accountRecordsToDisplay({count: this.countOfRecords}).then(response=> {
            console.log("Response from imperative apex class",response);
            this.recordsToDisplay=response;
        }).catch(error=>{
            console.log("Error",error);

        })
    }
}