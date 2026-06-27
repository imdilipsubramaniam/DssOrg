import { LightningElement, wire} from 'lwc';
import {getPicklistValues,getObjectInfo} from 'lightning/uiObjectInfoApi';
import CASE_OBJ from '@salesforce/schema/Case';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import STATUS from '@salesforce/schema/Case.Status';
import DESCRIPTION from '@salesforce/schema/Case.Description';
import SUBJECT from '@salesforce/schema/Case.Subject';
import { createRecord } from 'lightning/uiRecordApi';

export default class CustomCreateComponent extends LightningElement {

    priorityOptions;
    statusOptions;
    priorityValue;
    statusValue;
    subject;
    description;

    @wire(getObjectInfo,{objectApiName: CASE_OBJ})objectInfo;

    @wire(getPicklistValues,{recordTypeId:'$objectInfo.data.defaultRecordTypeId',fieldApiName:PRIORITY_FIELD})
    pickList({data,error}){
        if(data){
            this.priorityOptions =data.values;
        }else{
            console.error(error);
        }
    }

    @wire(getPicklistValues,{recordTypeId:'$objectInfo.data.defaultRecordTypeId',fieldApiName:STATUS})
    statusList({data,error}){
        if(data){
            this.statusOptions =data.values;

        }else{
            console.error(error);
        }
    }

    handlePriorityChange(event){
        this.priorityValue = event.detail.value;
    }

    handleStatusChange(event){
        this.statusValue = event.detail.value;
    }

    handleSubjectChange(event){
        this.subject = event.target.value;
    }

    handleDescriptionChange(event){
        this.description = event.target.value;
    }

    async handleCreate(){
        const fields={};
        fields[PRIORITY_FIELD.fieldApiName] = this.priorityValue;
        fields[STATUS.fieldApiName] = this.statusValue;
        fields[SUBJECT.fieldApiName] =this.subject;
        fields[DESCRIPTION.fieldApiName]= this.description;

        let recordInput ={apiName:CASE_OBJ.objectApiName,fields};
        await createRecord(recordInput)
        .then((data)=>{alert('Case created successfully with Id :'+ data.id)})
        .catch(error=> {alert('Error creating case :'+ error.message)});

    }

    handleReset(){
        this.priorityValue = null;
        this.statusValue = null;
        this.subject = '';
        this.description = '';
    }

}