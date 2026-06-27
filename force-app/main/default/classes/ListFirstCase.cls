public class ListFirstCase {
    public static List<Account> accountFetch(){
        List<Account> accList = [Select id, Name, industry from Account ];
        return accList;
    }
    
    public static void emailFetch(){
        Set<String> emails = new Set<String>();
        for(Contact con : [Select id, email from Contact where email != NULL]){
            emails.add(con.email);
        }
        
        system.debug(emails.size());
        system.debug(emails);
    }
    
    public static void oppStageName(){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Opportunity opp : [Select id, amount from opportunity where stagename ='closed won']){
            oppList.add(opp);
        }
        system.debug(oppList);
    }
    
    public static void uniqueAccountIds(){
        set<id> accids = new set<id>();
        for(Contact con : [Select id,accountid from contact where accountid != null]){
            accids.add(con.accountid);
        }
        system.debug(accids);
    }
    
    public static void leadName(){
        List<string> leadNames = new List<string>();
        for(Lead l :[SELECT Id,Name from Lead WHERE LeadSource ='Web']){
            leadNames.add(l.Name);
        }
        system.debug(leadNames);
    }
    
    public static void contactPhone(){
        List<String> phoneNumber = new List<String>();
        for(Contact con : [SELECT Id, Phone,MailingState FROM Contact WHERE MailingState ='California' AND Phone != NULL]){
            phoneNumber.add(con.Phone);
        }
        System.debug(phoneNumber);
    }
    
    public static void duplicateContact(){
        //find contact id of contacts that have duplicate email addresses
        Set<id> duplicateContacts = new Set<id>();
        Set<String> emailList = new Set<String>();
        for(AggregateResult result :[SELECT count(Id), Email FROM Contact where email != null group by email having count(id)>1]){
            emailList.add((String) result.get('Email'));
        }
        for(Contact con :[Select id from Contact WHERE email in : emailList]){
            duplicateContacts.add(con.id);
        } 
        system.debug(duplicateContacts);
    }	
    	/*single query approach
    	 * for (Contact con : [
        SELECT Id, Email 
        FROM Contact 
        WHERE Email IN (
            SELECT Email 
            FROM Contact 
            WHERE Email != null 
            GROUP BY Email 
            HAVING COUNT(Id) > 1
        ) */
    	
    	//remove duplicates from opp close dates
    	//SELECT count(Id), CloseDate FROM Opportunity group by CloseDate having count(id) > 4
    	//
    	
    	//remove dup name form opp and store in a list
    	//collect names in list and store the names in set
    	//
    	//
    	
    public static void billingStates(){
        set<string> billingState  = new set<string>();
        for(Account acc :[select id , name , billingstate from account where billingstate != null order by billingstate]){
            billingState.add(acc.billingstate);
        }
        system.debug(billingstate.size());
        system.debug(billingstate);
    }
}