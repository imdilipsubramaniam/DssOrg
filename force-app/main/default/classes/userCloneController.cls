public with sharing class userCloneController {
    @AuraEnabled(cacheable=true)
    public static List<User> getActiveUsers() {
        return [
            SELECT Id, Name, Username , Profile.Name
            From User
            Where IsActive = true
            Limit 100
        ];

    }

    @AuraEnabled(cacheable=true)
    public static userAccessWrapper getUserAccess(Id sourceUserId){
        if(sourceUserId == null){
            throw new AuraHandledException('Source User Id is required');
        }

        userAccessWrapper wrap = new userAccessWrapper();

        wrap.permissionSetIds = new List<Id>();
        wrap.permissionGroupIds = new List<Id>();

        for(PermissionSetAssignment psa : [
            SELECT PermissionSetId, PermissionSetGroupId 
            FROM PermissionSetAssignment
            WHERE AssigneeId =: sourceUserId
        ]){
            if (psa.PermissionSetId != null){
                wrap.permissionSetIds.add(psa.PermissionSetId);
            }
            if(psa.PermissionSetGroupId != null){
                wrap.permissionGroupIds.add(psa.PermissionSetGroupId);
            }
        }

        return wrap;
    }

    @AuraEnabled
    public static Id createUser(NewUserInput input){
        if (input == null) {
            throw new AuraHandledException('Input is required to create a new user');
        }

        // Normalize/coalesce incoming strings
        String firstName  = String.isBlank(input.FirstName) ? null : input.FirstName.trim();
        String lastName   = String.isBlank(input.LastName) ? null : input.LastName.trim();
        String email      = String.isBlank(input.Email) ? null : input.Email.trim();
        String username   = String.isBlank(input.Username) ? null : input.Username.trim();
        String aliasVal   = String.isBlank(input.Alias) ? null : input.Alias.trim();
        // String nickname = String.isBlank(input.Nickname) ? null : input.Nickname.trim();

        if (String.isBlank(lastName))  throw new AuraHandledException('Last Name is missing');
        if (String.isBlank(email))     throw new AuraHandledException('Email is missing');
        if (String.isBlank(username))  throw new AuraHandledException('Username is missing');
        if (String.isBlank(aliasVal))  throw new AuraHandledException('Alias is missing');

        User u = new User();
        u.FirstName = firstName;
        u.LastName  = lastName;
        u.Alias     = aliasVal;
        u.Username  = username;
        u.Email     = email;
        // u.Nickname  = nickname;

        // required fields defaults
        u.TimeZoneSidKey   = 'Asia/Kolkata';
        u.LanguageLocaleKey = 'en_US';
        u.LocaleSidKey     = 'en_IN';
        u.EmailEncodingKey = 'UTF-8';

        u.ProfileId = [
            SELECT Id
            FROM Profile
            WHERE Name = 'Standard User'
            LIMIT 1
        ].Id;

        insert u;

        return u.Id;
    }

    @AuraEnabled
    public static void clonePermissions(Id sourceUserId, Id targetUserId) {
        if (sourceUserId == null || targetUserId == null) {
            throw new AuraHandledException('Source and Target User Ids are required');
        }

        if (sourceUserId == targetUserId) {
            throw new AuraHandledException('Source and Target user cannot be the same');
        }

        // Fetch SOURCE user assignments
        List<PermissionSetAssignment> sourceAssignments = [
            SELECT PermissionSetId, PermissionSetGroupId
            FROM PermissionSetAssignment
            WHERE AssigneeId = :sourceUserId
        ];


        Set<Id> targetPermissionSets = new Set<Id>();
        Set<Id> targetPermissionSetGroups = new Set<Id>();

        for (PermissionSetAssignment psa : [
            SELECT PermissionSetId, PermissionSetGroupId
            FROM PermissionSetAssignment
            WHERE AssigneeId = :targetUserId
        ]) {
            if (psa.PermissionSetId != null) {
                targetPermissionSets.add(psa.PermissionSetId);
            }
            if (psa.PermissionSetGroupId != null) {
                targetPermissionSetGroups.add(psa.PermissionSetGroupId);
            }
        }

            List<PermissionSetAssignment> toInsert = new List<PermissionSetAssignment>();

    // Clone Permission Set Groups first
    for (PermissionSetAssignment psa : sourceAssignments) {
        if (psa.PermissionSetGroupId != null &&
            !targetPermissionSetGroups.contains(psa.PermissionSetGroupId)) {

            toInsert.add(new PermissionSetAssignment(
                AssigneeId = targetUserId,
                PermissionSetGroupId = psa.PermissionSetGroupId
            ));
        }
    }

    // Clone individual Permission Sets
    for (PermissionSetAssignment psa : sourceAssignments) {
        if (psa.PermissionSetId != null &&
            !targetPermissionSets.contains(psa.PermissionSetId)) {

            toInsert.add(new PermissionSetAssignment(
                AssigneeId = targetUserId,
                PermissionSetId = psa.PermissionSetId
            ));
        }
    }

    if (!toInsert.isEmpty()) {
        insert toInsert;
    }

    }

    public class userAccessWrapper {
        @AuraEnabled public List<Id> permissionSetIds;
        @AuraEnabled public List<Id> permissionGroupIds;
    }

    public class NewUserInput {
        @AuraEnabled public String FirstName;
        @AuraEnabled public String LastName;
        @AuraEnabled public String Email;
        @AuraEnabled public String Username;
        @AuraEnabled public String Alias;
        //@AuraEnabled public String Nickname;
    }
}