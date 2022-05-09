const assert = require('assert')

describe('Car safety page test', () => {
   it('Open page and accept cookies', () =>  {
       browser.url('/')
       const acceptCookiesButton = $('#onetrust-accept-btn-handler')
       acceptCookiesButton.click();
   })
})

