public with sharing class createAccountApex {
   @AuraEnabled
   public static void createAccount(string accountName){
    try {
        insert new Account(Name = accountName);
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
   }
}