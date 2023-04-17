public with sharing class AccountDomainFieldSet {
    @AuraEnabled(Cacheable = true)
    //Creating a queryString where we add fields name as per FieldSet and       fetch accounts as per queryString.
    public static List<Account> getAccount() {
         String queryString = 'select id';
        try {
           
            for (Schema.FieldSetMember fieldSet : SObjectType.Account.FieldSets.Account_Field_Sets.getFields()) {
                string field=fieldSet.getFieldPath();
                queryString += ',' + field;
            }
            queryString += ' from Account limit 100';
            system.debug(queryString);
           
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
         return Database.query(queryString);
    }
    @AuraEnabled
   // Create Map of Label and fieldName to use this map in columns of datatable
    public static string getFieldLableAndFieldAPI(){
        List<Map<String ,String>> listOfFieldSet  = new  List<Map<String ,String>>();
        try {
            for(Schema.FieldSetMember fieldset : SObjectType.Account.FieldSets.Account_Field_Sets.getFields()) {
                Map<String ,String> lableAPIMap = new Map<String ,String>();
                lableAPIMap.put(fieldset.getLabel(),fieldset.getFieldPath());
                listOfFieldSet.add(lableAPIMap);
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        system.debug(listOfFieldSet);
        return JSON.serialize(listOfFieldSet);

    }
}