import { LightningElement } from 'lwc';

export default class GetterAndSetter extends LightningElement {
    number=500;

    firstName ='david';
    lastName = 'miller'

    get handlegetterProperty(){
        return `here is the computed name ${this.firstName} ${this.lastName}` ;
    }

    _handleGetterSetter = this.number;

    get handleGetterSetter(){
        return this._handleGetterSetter;
    }

    set handleGetterSetter(value){
        this._handleGetterSetter= value < 1000 ? value : 5000;
    }

    handleGetterSetterChange(event){
        this.handleGetterSetter=event.target.value;
    }


}