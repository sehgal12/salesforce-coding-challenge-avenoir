import { LightningElement, api, wire, track } from 'lwc';
import { getRecord, getFieldValue } from "lightning/uiRecordApi";

import LAST_VIST_DATE_FIELD from "@salesforce/schema/Account.Last_Location_Visit_Date__c";
const fields = [LAST_VIST_DATE_FIELD];

export default class toast_AccountHealth extends LightningElement {
    @api
    recordId;
    @api
    lastDate;
    @track
    label = "";
    @track
    classname = "";

    //3. Wire the output of the out of the box method getRecord to the property account
    @wire(getRecord, {
        recordId: "$recordId",
        fields 
    })
    account;

    renderedCallback(){
        //this.lastDate = getFieldValue(this.account.data, LAST_VIST_DATE_FIELD)+"";
        let lastDate = new Date(this.lastDate);
        console.log("apex: "+ lastDate);
        let nowDate = new Date();
        let time_difference = (nowDate.getTime() - lastDate.getTime())
        var days_difference = time_difference / (1000 * 60 * 60 * 24);
        console.log("Javascript: "+ days_difference);
        if (days_difference < 30){
            this.label = "Green";
            this.classname = "slds-badge slds-theme_success";
        }
        else if (days_difference >= 30 && days_difference < 60){
            this.label = "Yellow";
            this.classname = "slds-badge slds-theme_warning";
        }
        else if (days_difference >= 60){
            this.label = "Red";
            this.classname = "slds-badge slds-theme_error";
        }        
    }

    @api
    get datefeild() {        
        this.lastDate = getFieldValue(this.account.data, LAST_VIST_DATE_FIELD)+"";
        console.log("Name: "+ this.lastDate);
        return this.lastDate;
    }
}