import { LightningElement, track, wire} from 'lwc';
import getAccountDetail from '@salesforce/apex/CustomListController.getAccountDetail';
const columns = [
    { label: 'Item Name', fieldName: 'Name', type: 'text', hideDefaultActions: true },
    { label: 'Type', fieldName: 'Type', type: 'text', hideDefaultActions: true },
    { label: 'Customer Priority', fieldName: 'CustomerPriority__c', hideDefaultActions: true },
];
 
const HIGH_PRIORITY = 'High';
const LOW_PRIORITY = 'Low';
const MEDIUM_PRIORITY = 'Medium';
const ALL_PRIORITY = 'All'

const filterOptions = [
    { value: HIGH_PRIORITY, label: HIGH_PRIORITY },
    { value: LOW_PRIORITY, label: LOW_PRIORITY },
    { value: MEDIUM_PRIORITY, label: MEDIUM_PRIORITY },
    { value: ALL_PRIORITY, label: ALL_PRIORITY },
];
 

export default class CustomListView extends LightningElement {
    @track isExpanded = false;
    @track currentFilter = ALL_PRIORITY;
    @track isLoaded = false;
    filterOptions = filterOptions;
    columns = columns;
 


    @track listViewStatus;
    allListViewStatus;
    High_value;

    renderedCallback() {
        this.isLoaded = true;
    }
 
    get dropdownTriggerClass() {
        if (this.isExpanded) {
            return 'slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click custom_list_view slds-is-open'
        } else {
            return 'slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click custom_list_view'
        }
    }
    @wire(getAccountDetail)
    wiredAccount({data,error}){
        console.log('dataaa',data)
        if(data){
        this.allListViewStatus = JSON.parse(JSON.stringify(data));
        this.listViewStatus = data.map((acc) => {
            this.High_value=acc.CustomerPriority__c;
            return acc;
        })
        }
        else if(error){
        console.log('error',error)

        }
    }
    handleFilterChangeButton(event) {
        this.isLoaded = false;
        let filter = event.target.dataset.filter;
        this.isExpanded = !this.isExpanded;
        if (filter !== this.currentFilter) {
            this.currentFilter = event.target.dataset.filter;
            setTimeout(() => {
                this.handleFilterData(this.currentFilter), 0
            });
        } else {
            this.isLoaded = true;
        }
    }
 
    handleFilterData(filter) {
        if (filter === ALL_PRIORITY) {
            this.listViewStatus = this.allListViewStatus
        } else {
            this.listViewStatus = this.allListViewStatus.filter(item => {
                if(item.CustomerPriority__c !=='' && item.CustomerPriority__c !== undefined){
                console.log('filter 84',filter)
                console.log('item.Priority',item.CustomerPriority__c)
                return item.CustomerPriority__c === filter;
                }
            })
            console.log(' this.listViewStatus 89', this.listViewStatus)
        }
        this.isLoaded = true;
    }
 
    handleClickExtend() {
        this.isExpanded = !this.isExpanded;
    }
}
