import { LightningElement,track } from 'lwc';

export default class ContactDisplay extends LightningElement {
    contact =[
        { Id: 1, Name: 'Abby', Email: 'abby@test.com', Phone: '123-456-7890' },
        { Id: 2, Name: 'Seth', Email: 'seth@test.com', Phone: '987-654-3210' },
        { Id: 3, Name: 'David', Email: 'david@test.com', Phone: '555-555-5555' },
        { Id: 4, Name: 'Miller', Email: 'miller@test.com', Phone: '111-222-3333' }
    ];

    @track searchKey='';
    //list-iterate it render to the html
    //

    get filteredContactRecords(){
        if(!this.searchKey){
            return this.contact;
        }
        const key = this.searchKey;
        return this.contact.filter(contact=> contact.Name.toLowerCase().includes(key)); 
             
    }


    handleSearchChange(event){
        this.searchKey = event.target.value;
    }
    
    
}