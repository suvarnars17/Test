import { LightningElement, track } from 'lwc';

export default class MyConditionRendering extends LightningElement {
    @track isVisible = false;
    changeHandler(event) {
        this.isVisible = event.target.checked;
    }
}