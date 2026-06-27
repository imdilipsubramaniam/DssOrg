import { LightningElement, wire } from 'lwc';
import accountRevenueRecordMethod from '@salesforce/apex/accountRevenueRecord.accountRevenueRecordMethod';
export default class AccountHighRevenue extends LightningElement {
    displayrecords=[];

    @wire(accountRevenueRecordMethod)
    getdisplayrecords(response){
        const {data,error}=response;

        if(error){
            console.log(error);
            return;            
        }
        if(data){
            this.displayrecords=data;
            
        }
    }

}