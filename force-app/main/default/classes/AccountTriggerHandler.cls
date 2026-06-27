public class AccountTriggerHandler {
	//class to track and update con industry from acc
    public static void accountTriggerContactUpdate(List<Account> accList,Map<Id,Account> oldAcc){
        set<id> accIds = new set<id>();
        for(Account acc : accList){
            accIds.add(acc.Id);
            system.debug(acc.Industry);
        }
        Map<Id,Account> newAcc = new Map<Id,Account>();
        for(Account acc : accList){
            newAcc.put(acc.id,acc);
        }
        system.debug(newAcc);
        List<Contact> conList = [Select id, name ,accountId, Industry__c From Contact Where accountId = : accIds];
        for(Contact con : conList){
            if(con.Industry__c != oldAcc.get(con.accountId).Industry){
                con.Industry__c = newAcc.get(con.accountId).Industry;
            }
        }
        
        update conList;
    }
}