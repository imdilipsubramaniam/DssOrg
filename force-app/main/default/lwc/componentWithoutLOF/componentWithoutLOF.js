import { LightningElement,wire,api } from 'lwc';
import {getRecord, getFieldValue} from 'lightning/uiRecordApi';
import CASE_NUMBER from '@salesforce/schema/Case.CaseNumber';
import ORIGIN from '@salesforce/schema/Case.Origin';
import PRIORITY from '@salesforce/schema/Case.Priority';
import STATUS from '@salesforce/schema/Case.Status';
export default class ComponentWithoutLOF extends LightningElement {
    @api recordId;
    fields = [CASE_NUMBER, ORIGIN,PRIORITY ,STATUS];

    @wire(getRecord, { recordId: '$recordId', fields: '$fields' }) caseRec;

    

    get CaseNum(){
        return getFieldValue(this.caseRec.data,CASE_NUMBER);
    }

    get Origin(){
        return getFieldValue(this.caseRec.data,ORIGIN);

    }
       
    get Priority(){
        return getFieldValue(this.caseRec.data,PRIORITY);
    }

    get Status(){
        return getFieldValue(this.caseRec.data,STATUS);
    }
    
    connectedCallback() {
    console.log('Record data:', this.caseRec.data);
}
}