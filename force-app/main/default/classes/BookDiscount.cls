public with sharing class BookDiscount {
    public static void applyDiscount(books__c[] book) {
        for (books__c bk :book){
            
            bk.Price__c *= 0.9;

        }
    }
}