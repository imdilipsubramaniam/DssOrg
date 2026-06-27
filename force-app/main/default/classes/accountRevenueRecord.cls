public with sharing class accountRevenueRecord {
    @AuraEnabled(cacheable=true)
    public static List<Account> accountRevenueRecordMethod(){
        try {
            return [SELECT Id,Name,AnnualRevenue FROM Account ORDER BY AnnualRevenue DESC NULLS LAST LIMIT 5];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}