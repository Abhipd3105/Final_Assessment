@isTest
public class AccountDomainFieldSetTest {
    
    @testsetup
    static void createLead(){
        List<Account> lst = new List<Account>();       
        for(Integer i = 0 ; i<50; i++) {
            Account acc=new Account();
            acc.Name='abc'+i;
            acc.Phone='1234567'+i;
            acc.Type='Customer - Channel';
            acc.Rating='hot';
            lst.add(acc);
            
          }
        insert lst; 
    }
 
    @isTest
    public static void getAccountTest()
    {
       Test.startTest();
        AccountDomainFieldSet.getAccount();
        Test.stopTest();  
    }
    
    @isTest
    public static void getFieldLableAndFieldAPITest()
    {
        Test.startTest();
        AccountDomainFieldSet.getFieldLableAndFieldAPI();
        Test.stopTest(); 
    }
    
    @isTest
    public static void getAccountListTest()
    {
        
        Test.startTest();
        AccountControllerFieldSet.getAccountList();
        Test.stopTest(); 
    }
}