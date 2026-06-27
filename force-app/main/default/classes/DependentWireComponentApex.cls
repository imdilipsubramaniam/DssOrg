public with sharing class DependentWireComponentApex {
    @AuraEnabled(cacheable =True)
    public static List<Account> getAccountDetails(Id recordId){
        return [SELECT Id, Name FROM Account WHERE Id =: recordId];
    }

    @AuraEnabled(cacheable =True)
    public static List<Task> getTaskDetails(String accountName){
        return [SELECT Id, Subject ,Status, Priority, Account.Name,ActivityDate  FROM Task WHERE Account.Name =: accountName];
    }
}