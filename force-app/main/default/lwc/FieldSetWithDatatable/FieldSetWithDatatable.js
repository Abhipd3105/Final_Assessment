import {LightningElement, wire} from 'lwc';
//import title from '@salesforce/label/c.FieldSet_example_with_datatable';
import getAccount from '@salesforce/apex/AccountControllerFieldSet.getAccountList';
import getFieldLableAndFieldAPI from '@salesforce/apex/AccountDomainFieldSet.getFieldLableAndFieldAPI';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'; 
export default class FieldSetWithDatatable extends LightningElement {
   // title = title;
    checkFieldSet= false;
    columns =[];
    data = [];
    dataIsPresent = false;
    connectedCallback(){
        this.handleClick();
    }

    @wire(getAccount)
    accountData({data, error}){
        if(data){
            this.data = data;
            console.log(data);
            this.dataIsPresent = true;
        }
        else if(error){
            this.showError(error);
        }
    }
    handleClick(){
        getFieldLableAndFieldAPI()
        .then((data) =>{
        console.log(data);
        let fieldSet = JSON.parse(data);
        console.log('fieldSet',fieldSet);
        this.columns.push({label : "Account Id", fieldName : "Id"});
        for (let index = 0; index < fieldSet.length; index++) {
            this.columns.push({label : Object.keys(fieldSet[index])[0], fieldName : Object.values(fieldSet[index])[0]});
        }
        this.checkFieldSet = true;
         })
        .catch((error) => {
            this.showError(error);
         });
    }
     showError(error){
        const event = new ShowToastEvent({
            title: 'Error',
            message: error
       });
       this.dispatchEvent(event);
    }
}