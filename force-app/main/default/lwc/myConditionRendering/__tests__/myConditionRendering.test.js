import { createElement } from 'lwc';
import MyConditionRendering from 'c/myConditionRendering';

describe('c-my-condition-rendering', () => {
    beforeEach(() => {
        const element =createElement('c-my-condition-rendering',{
            is:MyConditionRendering
        })
        document.body.appendChild(element)
    });

    it("don't show password", () => {
        // Arrange
        const element = document.querySelector('c-my-condition-rendering')
        const inputElement = element.shadowRoot('.userinfo')
        expect(inputElement.textContent).toBe('My password is **********');
    });
    it("show user password when checkbox is chceked",()=>{
        const element = document.querySelector('c-my-condition-rendering')  
        const inputElement = element.shadowRoot('.lightning-input')
        inputElement.checked=true
        inputElement.dispatchEvent(new CustomEvent('change'))
    })
    return Promise.resolve().then(()=>{
        const passwordElement = element.shadowRoot('.userinfo')  
        expect(passwordElement.textContent).toBe('My password is Suvarna@596');
    })
});