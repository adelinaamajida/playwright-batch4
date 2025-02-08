import HomePage from '../locator/homePage';
import { expect } from '@playwright/test';

export default class HomepageAction {
    constructor(page) {
        this.page = page;
        this.homePage = new HomePage();

        this.backpackProduct = page.locator(this.homePage.backpackProduct);
        this.bikelightProduct = page.locator(this.homePage.bikelightProduct);
        this.buttonCart = page.locator(this.homePage.buttonCart);
    }

    async verifyHomepage() {
        await expect(this.backpackProduct).toBeVisible(); //validate user successfully move to homepage
    }

    async addBackpackAndBikelightToCart() {
        await this.backpackProduct.click();
        await this.bikelightProduct.click();
    }

    async accessCheckoutPage() {
        await this.buttonCart.click();
    }

}