public class LearningApexClass {
	public integer age;
    Boolean isLifeGood ;
    string howGoodIsIt = 'default constructor';
    public Boolean isThisCorrect;
    public Account myAccRecord = null;
    private Date todaysDate = System.today();
    
    
    public LearningApexClass(){
        
    }
    
    public LearningApexClass(integer age){
        this.age = age;
        this.todaysDate = Date.newInstance(2010,06,04);
        this.howGoodIsIt = '1st consturtor';
    }
    
    public LearningApexClass(integer age, boolean isThisCorrect){
        this.age = age;
        this.isThisCorrect =isThisCorrect;
        this.todaysDate = Date.newInstance(2015,06,04);
        this.howGoodIsIt = '2nd consturtor';
    }
    
    public static decimal calculateDiscountedSellingPrice(Decimal sellingPrice, Integer discountRate){
        decimal finalPrice = (sellingPrice - (sellingPrice*discountRate)/100);
        return finalPrice;
    }
    
    public static string calculateAge(Date dateOfBirth){
        LearningApexClass obj = new LearningApexClass(22,true);
        date today = obj.todaysDate;
        string consNum = obj.howGoodIsIt;
        Integer age =today.year()- dateOfBirth.year();
        string value = 'Result from :'+consNum+ 'and age is ' +age;
        return value;
    }
    
}