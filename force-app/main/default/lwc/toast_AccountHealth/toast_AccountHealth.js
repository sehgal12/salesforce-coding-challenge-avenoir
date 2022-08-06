import { LightningElement, wire } from 'lwc';
import daysPassed from '@salesforce/schema/Account.Days__c';
import getDays from '@salesforce/apex/RestaurantLocationTriggerHandler.getDays';

export default class toast_AccountHealth extends LightningElement {
 red = false;
 green = true;
 yellow = false; 
 connectedCallback() {
   this.getLabel();
 }

 @wire(getDays) days; 
 getLabel(){
        if (days > 0) {
            if (days < 30) {
                this.green = true;
            }
            else if (30 < days < 60) {
                this.yellow = true
            }
            else if (60 < days) {
                this.red = true;
            }
        } 
    } 
}