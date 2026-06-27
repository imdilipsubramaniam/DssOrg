import { LightningElement } from 'lwc';

export default class MainComponent extends LightningElement {
    

    productList = [
        {id:1, name:'Laptop', price: 50000},
        {id:2, name:'Mobile', price: 20000},
        {id:3, name:'Tablet', price: 30000}
    ]

    handleClick(){
        this.template.querySelector('c-child-component').handleButtonClick();
    }
}