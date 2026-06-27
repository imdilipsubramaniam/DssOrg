trigger BookDiscountTrigger on books__c (before insert) {
    books__c [] book = Trigger.new;
    BookDiscount.applyDiscount(book);

}