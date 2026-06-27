import { LightningElement, api, wire } from 'lwc';
import getAccountDetails from '@salesforce/apex/DependentWireComponentApex.getAccountDetails';
import getTaskDetails from '@salesforce/apex/DependentWireComponentApex.getTaskDetails';

export default class DependentWireComponents extends LightningElement {
    //get the record id using the comp
    //then use wire to get the name of the account
    //pass the name to another wire and get the tasks associated with the acc
    @api recordId;
    accountName;
    taskList ;
    taskExist = false;

    @wire(getAccountDetails, { recordId: '$recordId' })
    accountDetails({ data, error }) {
        try {
            if (data) {
                console.log('Account Details :',data[0].Name);
                this.accountName = data[0].Name;
            }else{
                console.error(error);
            }

        } catch (error) {
            console.error(error);
        }
    }

    @wire(getTaskDetails,{accountName : '$accountName'})
    taskDetails({data,error}){
        if(data){
            this.taskExist = true;
            console.log('Task Details :',data);
            this.taskList = data;

        }else{
            console.error(error);
        }
    }


}