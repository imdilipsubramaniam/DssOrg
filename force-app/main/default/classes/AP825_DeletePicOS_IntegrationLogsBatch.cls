public with sharing class AP825_DeletePicOS_IntegrationLogsBatch 
    implements Database.Batchable<SObject>, Schedulable {

    //start method
    public Database.QueryLocator start(Database.BatchableContext bc) {
        //date 2 years ago
        Date twoYearsAgo = System.today().addYears(-2);

        // Query records older than 2 years
        return Database.getQueryLocator([
            SELECT Id 
            FROM PicOS_Integration_Logs__c 
            WHERE CreatedDate < :twoYearsAgo
        ]);
    }

    // execute method
    public void execute(Database.BatchableContext bc, List<PicOS_Integration_Logs__c> scope) {
        try {
            if (!scope.isEmpty()) {
                delete scope;
            }
        } catch (Exception e) {
            System.debug('Error deleting old logs: ' + e.getMessage());
        }
    }

    //finish method
    public void finish(Database.BatchableContext bc) {
        System.debug('Batch completed: Old integration logs deleted successfully.');
    }

    //scheduler
    public void execute(SchedulableContext sc) {
        AP825_DeletePicOS_IntegrationLogsBatch batch = new AP825_DeletePicOS_IntegrationLogsBatch();
        Database.executeBatch(batch, 200);
    }
}