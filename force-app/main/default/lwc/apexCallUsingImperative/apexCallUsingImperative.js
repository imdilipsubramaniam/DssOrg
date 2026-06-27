import { LightningElement,wire } from 'lwc';
import {getObjectInfo , getPicklistValues} from  'lightning/uiObjectInfoApi';
import CASE_OBJ from '@salesforce/schema/Case';
import ORIGIN_FIELD from  '@salesforce/schema/Case.Origin';
import caseRecordFetch from '@salesforce/apex/ControllerForComponent.caseRecordFetch';

export default class ControllerComponentOrigin extends LightningElement {

    caseOptions ;
    caseOriginValue;
    caseDetails =[];
    showTable = false;

    @wire(getObjectInfo,{objectApiName : CASE_OBJ})caseInfo;

    @wire(getPicklistValues,{recordTypeId :'$caseInfo.data.defaultRecordTypeId',fieldApiName : ORIGIN_FIELD})
    originPicklistVal({data,error}){
        if(data){
            this.caseOptions = data.values;
        }else{
            console.error(error);
        }
    }

    handleOriginChange(event){
        this.caseOriginValue = event.target.value;
        console.log(this.caseOriginValue);
    }

    imperativeCaseCreation(){
        caseRecordFetch({originVal : this.caseOriginValue})
        .then(result => {this.showTable = true; this.caseDetails = result;})
        .catch(error => console.error(error));


    }
}