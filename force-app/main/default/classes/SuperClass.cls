public virtual class SuperClass {
    public string myName;
    public string myLastName;
    //
    //default constructor 
    public SuperClass(){
        myName = 'Dilip';
        myLastName = 'Subramaniam';
    }
    
    public SuperClass(string name, string lastname){
        string myName = name;
        string myLastName = lastname;
    }
    
    public virtual void printName(){
        system.debug('Call me '+myName+ ' ' +myLastName);
        
    }
    

}