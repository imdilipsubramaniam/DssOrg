public class PracticeClass {
	
    //count the duplicates - map <string , integer> 
    
    public static void countDuplicates(){
        List<String> names = new List<String>{
            'Google',
            'Microsoft',
            'Google',
            'Amazon',
            'Microsoft',
            'Google'
        };
            
            Map<String,Integer> duplicateCountMap = new Map<String,Integer>();            
            for(String name : names){
                if(!duplicateCountMap.containsKey(name)){
                    duplicateCountMap.put(name,1);
                }else{
                  duplicateCountMap.put(name,duplicateCountMap.get(name)+1);  
                }
                //duplicateCountMap.put(name, duplicateCountMap.containsKey(name) ? duplicateCountMap.get(name) + 1 : 1);

            }
        System.debug(JSON.serializePretty(duplicateCountMap));

        for(String key : duplicateCountMap.keyset()){
            
            System.debug('Account '+ key + ': Dup Count :' + duplicateCountMap.get(key));
        }
    }
    
    public static void topSalesOwner(List<Opportunity> oppList){
        Map<String, Decimal> salesMap = new Map<String,Decimal>();
        for(Opportunity o : oppList){
            if(salesMap.containsKey(o.ownerid)){
               decimal currentTotal = salesMap.get(o.ownerId);
                salesMap.put(o.ownerId, currentTotal + o.Amount);
            }else{
                salesMap.put(o.ownerId,o.Amount);
            }
        }
        Decimal maxAmount = 0;
        String topSalesPerson;
        for(String key : salesMap.keySet()){
            if(salesMap.get(key)>maxAmount){
                maxAmount = salesMap.get(key);
                topSalesPerson = key;
                
            }
        }
        system.debug(topsalesPerson +':'+ maxAmount);
    }
}