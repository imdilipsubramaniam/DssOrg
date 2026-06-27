public with sharing class imperativeAccountClass {
    @AuraEnabled(cacheable=true)
    public static List<Account> accountRecordsToDisplay(Integer count){
        try {
            return [SELECT Id, Name, AnnualRevenue FROM Account WHERE AnnualRevenue>1500000 
            ORDER BY AnnualRevenue ASC NULLS LAST LIMIT :count];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}