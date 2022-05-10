const { URL } = require('../utils/commons')

describe('Explore car models test', () => {
    it('Open page and accept cookies', async () => {
        await browser.url(URL);
        const acceptCookiesButton = await $('#onetrust-accept-btn-handler');
        await acceptCookiesButton.click();
        expect(browser).toHaveUrl(URL);
    })

    it('Check car carousel', async () => {
        const carousel = await $('[data-autoid=ProductListCarousel-1]');
        expect(carousel).toBeDisplayed();

        //Check title
        const carouselTitle = await $("[data-autoid='productListCarousel:title']");
        expect(carouselTitle).toBeDisplayed();
        expect(carouselTitle).toHaveText('Explore our models');

        //Get all carousel items
        const allItems = await carousel.$$("[data-autoid='springCarouselPane:carouselItem']"); 
        expect(allItems).toHaveChildren(8);

        //Check each carousel item
        var index = 0;
        for(var index = 0; index < allItems.length; index++) {
            //Single carousel item
            const currentItem = allItems[index];
            const itemSingle = await currentItem.$("[data-autoid='productListCarouselItem-" + index + "']");
            expect(itemSingle).toBeDisplayed();

            //Category exists
            const category = await itemSingle.$("[data-autoid='productListCarouselItem:category']");
            expect(category).toBeDisplayed();
        };
    })    

})

