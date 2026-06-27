@IsTest
private class picos_Batchtest {

    // -----------------------------------------------------------------
    // TEST SETUP: Create sample logs (some old, some recent)
    // -----------------------------------------------------------------
    @TestSetup
    static void setupData() {
        List<PicOS_Integration_Logs__c> logsToInsert = new List<PicOS_Integration_Logs__c>();

        // Create 15 total logs (10 old + 5 recent)
        for (Integer i = 0; i < 15; i++) {
            logsToInsert.add(new PicOS_Integration_Logs__c(
                Name = 'Integration Log ' + i
            ));
        }
        insert logsToInsert;

        // Mark 10 logs as 3 years old using Test.setCreatedDate
        List<PicOS_Integration_Logs__c> oldLogs = [
            SELECT Id FROM PicOS_Integration_Logs__c LIMIT 10
        ];
        for (PicOS_Integration_Logs__c log : oldLogs) {
            Test.setCreatedDate(log.Id, System.today().addYears(-3));
        }
    }

    // -----------------------------------------------------------------
    // MAIN TEST 1: Validate that the batch deletes 2+ year old records
    // -----------------------------------------------------------------
    @IsTest
    static void testBatchDeletesOldLogs() {
        // Verify total records before batch run
        Integer totalBefore = [SELECT COUNT() FROM PicOS_Integration_Logs__c];
        System.assertEquals(15, totalBefore, 'Expected 15 total logs before batch run.');

        Test.startTest();
        // Execute the batch (scope size 200 for best practice)
        Database.executeBatch(new AP825_DeletePicOS_IntegrationLogsBatch(), 200);
        Test.stopTest();

        // After batch, only recent 5 logs should remain
        Integer remaining = [SELECT COUNT() FROM PicOS_Integration_Logs__c];
        System.assertEquals(5, remaining,
            'Only 5 recent logs should remain after deleting 10 old logs.');
    }

    // -----------------------------------------------------------------
    // MAIN TEST 2: Validate batch is schedulable
    // -----------------------------------------------------------------
    @IsTest
    static void testBatchIsSchedulable() {
        // Ensure the class can be scheduled properly
        String CRON_EXP = '0 0 1 * * ?'; // Daily at 1 AM

        Test.startTest();
        String jobId = System.schedule('Test_DeletePicOS_Logs_Schedule',
                                       CRON_EXP,
                                       new AP825_DeletePicOS_IntegrationLogsBatch());
        Test.stopTest();

        // Assert that the job has been scheduled
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime
                          FROM CronTrigger WHERE Id = :jobId];
        System.assertEquals(CRON_EXP, ct.CronExpression,
            'The scheduled job should match the cron expression.');
    }

    // -----------------------------------------------------------------
    // MAIN TEST 3: Validate behavior when there are no old logs
    // -----------------------------------------------------------------
    @IsTest
    static void testBatchWhenNoOldLogs() {
        // Delete any old data from setup and recreate only recent logs
        delete [SELECT Id FROM PicOS_Integration_Logs__c];

        List<PicOS_Integration_Logs__c> recentLogs = new List<PicOS_Integration_Logs__c>();
        for (Integer i = 0; i < 5; i++) {
            recentLogs.add(new PicOS_Integration_Logs__c(Name = 'Recent Log ' + i));
        }
        insert recentLogs;

        Test.startTest();
        Database.executeBatch(new AP825_DeletePicOS_IntegrationLogsBatch(), 200);
        Test.stopTest();

        // No records should be deleted
        Integer remaining = [SELECT COUNT() FROM PicOS_Integration_Logs__c];
        System.assertEquals(5, remaining, 'All recent logs should remain untouched.');
    }
}