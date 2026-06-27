import { LightningElement, track } from 'lwc';

export default class StudentRegistrationForm extends LightningElement {

    firstName = "";
    rollNumber = 0;
    email = "";

    nonPrimitiveData = {};

    @track reactiveNonPrimitive = {};

    handleNameChange(event) {
        console.log("First name is updating");
        //this.firstName = event.target.value;
        //this.nonPrimitiveData.firstName = event.target.value;
        this.reactiveNonPrimitive.firstName = event.target.value;
    }

    handleRollNumberChange(event) {
        console.log("Roll number is updating");
        //this.rollNumber = event.target.value;
        //this.nonPrimitiveData.rollNumber = event.target.value;
        this.reactiveNonPrimitive.rollNumber = event.target.value;
    }

    handleEmailChange(event) {
        console.log("Email is updating");
        //this.email = event.target.value;
        //this.nonPrimitiveData.email = event.target.value;
        this.reactiveNonPrimitive.email = event.target.value;
    }
}