public class UpdateContactIndustry {
    public static void updateIndustry(){
        List<Contact> conList = [SELECT Id, LastName, Industry__c , Account.Industry FROM Contact];
        List<Contact> conUpdate = new List<Contact>();
        for(Contact con : conList){
            if(con.Industry__c == Null && con.Account.Industry != Null){
                con.Industry__c = con.Account.Industry;
                conUpdate.add(con);
            }
        }
        if(!conList.isEmpty()){
            update conUpdate;
        }
        
    }
}