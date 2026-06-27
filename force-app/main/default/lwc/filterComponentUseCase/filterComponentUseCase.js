import { LightningElement } from 'lwc';

export default class FilterComponentUseCase extends LightningElement {

    filterValue;
    categoryValue;
    sortValue;

    categoryOptions = [
        {label: "All", value: "All" },
        { label: "Learning", value: "Learning" },
        { label: "Games", value: "Games" },
        { label: "Food", value: "Food" }
    ];



    sortOptions = [
        { label: "AESC A-Z", value: "AESC" },
        { label: "DESC Z-A", value: "DESC" }
    ];

    columns = [
        { label: 'Id', fieldName: 'Id' },
        { label: 'Name', fieldName: 'Name' },
        { label: 'Category', fieldName: 'Category'},
        { label: 'Rating', fieldName: 'Rating'},
        
    ];

    data =[{Id:'1',Name:'LWC learning', Category :'Learning', Rating: '78'},
        {Id:'2',Name:'Apex Learning', Category :'Learning', Rating: '75'},
        {Id:'3',Name:'Call of Duty', Category :'Games', Rating: '80'},
        {Id:'4',Name:'Total Overdose', Category :'Games', Rating: '65'},
        {Id:'5',Name:'Chicken', Category :'Food', Rating: '74'},
        {Id:'6',Name:'Mutton', Category :'Food', Rating: '88'}
    ];

    changeFilter(event){
        this.filterValue = event.target.value;
        console.log('filter value:', this.filterValue);
    }

    changeCategory(event){
        this.categoryValue= event.target.value;
        console.log('category value:', this.categoryValue);
    }   

    changeSort(event){
        this.sortValue = event.target.value;
    }

    //use getter and filter and return values based on the filter value and catergoryvalue

    get filteredData(){
        const filterValue = (this.filterValue || '').toLowerCase();
        console.log('ds:',filterValue);
        let result = this.data.filter(item=>{
            const textMatch = item.Name.toLowerCase().includes(filterValue);
            const categoryMatch = this.categoryValue ==="All" || item.Category == this.categoryValue;

            return textMatch && categoryMatch;
        });

        result = [...result].sort((a,b)=>{
            switch(this.sortValue){
                case 'AESC':
                    return a.Name.localeCompare(b.Name);
                case 'DESC':
                    return b.Name.localeCompare(a.Name);
            }
        });

        return result;
    }


}