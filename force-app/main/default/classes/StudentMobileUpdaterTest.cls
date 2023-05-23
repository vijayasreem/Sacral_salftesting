@IsTest 
public class StudentMobileUpdaterTest { 
    @IsTest static void updateMobileField_Test1() { 
        //create sample student record 
        Student__c student = new Student__c(); 
        student.Phone__c = '123456789'; 
        insert student; 
        //create new list for test 
        List<Student__c> studentList = new List<Student__c>(); 
        studentList.add(student); 
        //call class method 
        StudentMobileUpdater.updateMobileField(studentList); 
        //verify mobile field was updated with the same value as phone field 
        Student__c updatedStudent = [SELECT Mobile__c FROM Student__c WHERE Id = :student.Id]; 
        System.assertEquals('123456789', updatedStudent.Mobile__c); 
    } 
    @IsTest static void updateMobileField_Test2() { 
        //create sample student record 
        Student__c student = new Student__c(); 
        student.Phone__c = null; 
        insert student; 
        //create new list for test 
        List<Student__c> studentList = new List<Student__c>(); 
        studentList.add(student); 
        //call class method 
        StudentMobileUpdater.updateMobileField(studentList); 
        //verify mobile field was cleared 
        Student__c updatedStudent = [SELECT Mobile__c FROM Student__c WHERE Id = :student.Id]; 
        System.assertEquals(null, updatedStudent.Mobile__c); 
    } 
}