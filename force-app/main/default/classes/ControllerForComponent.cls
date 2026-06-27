public with sharing class ControllerForComponent {
    public ControllerForComponent() {

    }
    //Task get filter and fetch case objects based on origin in UI, 
    //Get picklist value , pass the value as para to apex find and use call back to show details in ui.

    @AuraEnabled(cacheable=true)
    public static List<Case> caseRecordFetch(String originVal){
        return [SELECT Id,CaseNumber,Origin,Subject,Description FROM Case WHERE Origin = : originVal ORDER BY CreatedDate LIMIT 10];
    }
}