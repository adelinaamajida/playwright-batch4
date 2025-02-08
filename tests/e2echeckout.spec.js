import { test, expect } from '@playwright/test';
import LoginAction from './pom/objectAction/loginAction';
import HomepageAction from './pom/objectAction/homepageAction';
import CheckoutAction from './pom/objectAction/checkoutAction';

test('Ensure login user able to checkout backpack and bikelight product and redirect back to the homepage', async ({ page }) => {
    const loginAction = new LoginAction(page);
    const homepageAction = new HomepageAction(page);
    const checkoutAction = new CheckoutAction(page);

    await loginAction.goto();
    await loginAction.userLogin();
    await homepageAction.verifyHomepage();
    await homepageAction.addBackpackAndBikelightToCart();
    await homepageAction.accessCheckoutPage();
    await checkoutAction.verifyCheckoutPage();
    await checkoutAction.clickCheckout();
    await checkoutAction.verifyUserInformationPage();
    await checkoutAction.fillUserInformation();
    await checkoutAction.clickContinue();
    await checkoutAction.verifyOverviewPage();
    await checkoutAction.clickFinish();
    await checkoutAction.verifyCheckoutComplete();
    await checkoutAction.redirectBackToHomepage();
    await homepageAction.verifyHomepage();
});