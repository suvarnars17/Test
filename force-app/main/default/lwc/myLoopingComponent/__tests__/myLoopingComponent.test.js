import { createElement } from 'lwc';
import MyLoopingComponent from 'c/myLoopingComponent';
const EXPECTED = ['suvarna',
    'john',
    'chinna']
describe('c-my-looping-component', () => {
    beforeEach(() => {
        const element = createElement('c-my-looping-component', {
            is: MyLoopingComponent
        })
        document.body.appendChild(element);
    });

    it('check user list length', () => {
        // Arrange
        const element = document.querySelector('c-my-looping-component')
        const userDetail = element.querySelectorAll('.forEachList>li')
        expect(userDetail.length).toBe(3);
    });
    it('display  user list in specific order', () => {
        // Arrange
        const element = document.querySelector('c-my-looping-component')
        const userDetail = Array.from(element.querySelectorAll('.forEachList>li'))
        const userList = userDetail.map(li => li.textContent)
        expect(userList.length).toBe(3);
        expect(userList).toEqual(EXPECTED);
    });
    test('displays first and last text in iterator loop', () => {
        const element = document.querySelector('c-my-looping-component')
        const firstDiv = element.document.querySelector('.iteratorList>li:first-child>div:first-child')

        expect(firstDiv.textContent).toBe('Start of list)
const lastDiv = element.shadowRoot.querySelectr('.iteratorList>li:last-child>div.last-child')
        expect(lastDiv.textContent).toBe('End of list)
    })
});