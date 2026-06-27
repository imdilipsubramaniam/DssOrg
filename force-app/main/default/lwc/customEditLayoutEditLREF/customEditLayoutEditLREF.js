import { LightningElement, api } from 'lwc';

export default class CustomEditLayoutEditLREF extends LightningElement {
    @api recordId;
    @api objectApiName = 'Account';

    handleSuccess(event) {
        const editForm = this.template.querySelector('lightning-record-edit-form');
        editForm.reset();
    }

    handleError(event) {
        console.error(event.detail);
    }




}