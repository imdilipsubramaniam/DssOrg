public class FutureCallPractice {
	// Future method must be static and return void
    @future(callout=true)   // callout=true if you’re making HTTP callouts
    public static void updateAccountIndustry() {
        List<Account> accs = [Select id, Name, industry from Account where id = '001WU00000uipTBYAY' ];
        
        for (Account acc : accs) {
            acc.Industry = 'Technology';  // Example business logic
        }
        
        update accs;
        system.debug('Industry updated');
    }
}