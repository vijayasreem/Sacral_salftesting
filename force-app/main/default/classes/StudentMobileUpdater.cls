public with sharing class StudentMobileUpdater { 
    public static void updateMobileField(List<Student__c> newStudents) { 
        //loop through list of new student records 
        for(Student__c student : newStudents) { 
            //if student phone field is populated, populate the mobile field with the same value 
            if(student.Phone__c != null) { 
                student.Mobile__c = student.Phone__c; 
            } 
            //else, if student phone field is null, clear the mobile field 
            else { 
                student.Mobile__c = null; 
            } 
        } 
        //update all student records in the list 
        update newStudents; 
    } 
}