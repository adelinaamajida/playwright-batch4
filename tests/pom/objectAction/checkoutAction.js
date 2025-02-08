import CheckoutPage from '../locator/checkoutPage';
import { expect } from '@playwright/test';

export default class CheckoutAction {
    constructor(page) {
        this.page = page;
        this.checkoutPage = new CheckoutPage();

        this.buttonCheckout = page.locator(this.checkoutPage.buttonCheckout);
        this.inputFirstName = page.locator(this.checkoutPage.inputFirstName);
        this.inputLastName = page.locator(this.checkoutPage.inputLastName);
        this.inputZipCode = page.locator(this.checkoutPage.inputZipCode);
        this.buttonContinue = page.locator(this.checkoutPage.buttonContinue);
        this.buttonFinish = page.locator(this.checkoutPage.buttonFinish);
        this.buttonBackHome = page.locator(this.checkoutPage.buttonBackHome);

    }

    async verifyCheckoutPage() {
        await expect(this.buttonCheckout).toBeVisible(); //validate user move to checkout page
    }

    async clickCheckout() {
        await this.buttonCheckout.click();
    }

    async verifyUserInformationPage() {
        await expect(this.inputFirstName).toBeVisible(); //validate user move to your information page
    }

    async fillUserInformation() {
        await this.inputFirstName.fill('Luna');
        await expect(this.inputFirstName).toHaveValue('Luna');
        await this.inputLastName.fill('Moonfang');
        await expect(this.inputLastName).toHaveValue('Moonfang');
        await this.inputZipCode.fill('55555');
        await expect(this.inputZipCode).toHaveValue('55555');
    }

    async clickContinue() {
        await this.buttonContinue.click();
    }

    async verifyOverviewPage() {
        await expect(this.buttonFinish).toBeVisible(); //validate user move to checkout overview
    }

    async clickFinish() {
        await this.buttonFinish.click();
    }

    async verifyCheckoutComplete() {
        await expect(this.buttonBackHome).toBeVisible(); //validate user move to checkout complete notice
    }

    async redirectBackToHomepage() {
        await this.buttonBackHome.click();
    }

}